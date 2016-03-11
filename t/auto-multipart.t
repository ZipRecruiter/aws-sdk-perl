#!/usr/bin/env perl

package A;

use Moo;
use Try::Tiny;
use Paws;

has force_multipart => ( is => 'ro' );

has allow_multipart => (
  is => 'ro',
  default => 1,
);

has chunk_size => (
  is => 'ro',
  # 100 megabytes
  default => 100 * 1024 * 1024,
);

has multipart_threshold => (
  is => 'ro',
  default => 1024 * 1024 * 1024,
);

has _s3 => (
  is => 'ro',
  lazy => 1,
  builder => sub { Paws->service('S3', region => 'us-east-1') },
);

sub _slurp {
  my $fh = shift;

  my $body;
  while (! $fh->eof) {
    # this is the size PerlIO reads
    defined($fh->read(my $tmp, 8 * 1024))
      or die "Failed to read: $!";
    $body .= $tmp;
  }
  return $body
}

sub _put_upload {
  my ($self, $fh, @rest) = @_;

  # really, PutObject should be able to take an $fh so that even the small
  # files don't have to be completely loaded into memory, but instead streamed
  # to the body of the http request
  $self->_s3->PutObject(
    @rest,
    Body => _slurp($fh),
  );
}

sub _multi_upload {
  my ($self, $fh, @rest) = @_;

  my $id = $self->_s3->CreateMultipartUpload(@rest)->UploadId;
  my $part = 1;

  try {
    while (! $fh->eof) {
      defined($fh->read(my $buffer, $self->chunk_size))
        or die "Failed to read: $!";

      # Similar to PutObject, UploadPart should allow a filehandle for Body to
      # allow streaming.
      $self->_s3->UploadPart(
        UploadId => $id,
        Body => $buffer,
        PartNumber => $part++,
        @rest,
      )
    }

    $self->_s3->CompleteMultipartUpload(
      UploadId => $id,
      @rest,
    );
  } catch {
    $self->_s3->AbortMultipartUpload(
      UploadId => $id,
      @rest,
    );
    die "Failed to upload data, aborted: $!";
  };

}

sub upload {
  my ($self, %params) = @_;

  my $fh = delete $params{fh} or die "fh is required!";


  return $self->_put_upload($fh, %params) unless $self->allow_multipart;
  return $self->_multi_upload($fh, %params)
  if $self->force_multipart;

  return $self->_multi_upload($fh, %params)
  if (($fh->stat)[7] > $self->multipart_threshold);
  return $self->_put_upload($fh, %params);
}

package main;

use autodie;

my $key = shift;
my $to_upload = shift;
my $multipart = shift;
open my $fh, '<', $to_upload;

A->new(
  chunk_size => 1024,
  $multipart
    ? ( force_multipart => 1 )
    : ( allow_multipart => 0 )
)->upload(
  Bucket => 'test.ziprecruiter.com',
  Key => $key,
  fh => $fh,
);
