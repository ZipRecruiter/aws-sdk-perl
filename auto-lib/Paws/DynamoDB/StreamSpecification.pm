package Paws::DynamoDB::StreamSpecification;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has StreamEnabled => (is => 'ro', isa => Bool);
  has StreamViewType => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{StreamEnabled}) {
      $res{StreamEnabled} = (map {
            0 + !!$_
      } ($args->{StreamEnabled}))[0];
    }
    if (exists $args->{StreamViewType}) {
      $res{StreamViewType} = (map {
            "$_"
      } ($args->{StreamViewType}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "StreamEnabled") {
        my $key = "StreamEnabled";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "StreamViewType") {
        my $key = "StreamViewType";
            $res->{$key} = "" . ( $_->nodeValue // '' );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{StreamEnabled}) {
      $res{StreamEnabled} = (map {
            0 + !!$_
      } ($self->StreamEnabled))[0];
    }
    if (exists $self->{StreamViewType}) {
      $res{StreamViewType} = (map {
            "$_"
      } ($self->StreamViewType))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{StreamEnabled}) {
      $res{StreamEnabled} = (map {
            $_ ? \1 : \0
      } ($self->StreamEnabled))[0];
    }
    if (exists $self->{StreamViewType}) {
      $res{StreamViewType} = (map {
            "$_"
      } ($self->StreamViewType))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{StreamEnabled}) {
      my $key = "${prefix}StreamEnabled";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->StreamEnabled;
    }

    if (exists $self->{StreamViewType}) {
      my $key = "${prefix}StreamViewType";
      do {
            $res->{$key} = "$_";
      } for $self->StreamViewType;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::StreamSpecification

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::StreamSpecification object:

  $service_obj->Method(Att1 => { StreamEnabled => $value, ..., StreamViewType => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::StreamSpecification object:

  $result = $service_obj->Method(...);
  $result->Att1->StreamEnabled

=head1 DESCRIPTION

Represents the DynamoDB Streams configuration for a table in DynamoDB.

=head1 ATTRIBUTES


=head2 StreamEnabled => Bool

  Indicates whether DynamoDB Streams is enabled (true) or disabled
(false) on the table.


=head2 StreamViewType => Str

  When an item in the table is modified, C<StreamViewType> determines
what information is written to the stream for this table. Valid values
for C<StreamViewType> are:

=over

=item *

C<KEYS_ONLY> - Only the key attributes of the modified item are written
to the stream.

=item *

C<NEW_IMAGE> - The entire item, as it appears after it was modified, is
written to the stream.

=item *

C<OLD_IMAGE> - The entire item, as it appeared before it was modified,
is written to the stream.

=item *

C<NEW_AND_OLD_IMAGES> - Both the new and the old item images of the
item are written to the stream.

=back




=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
