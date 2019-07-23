package Paws::DynamoDB::RestoreSummary;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has RestoreDateTime => (is => 'ro', isa => Str, required => 1);
  has RestoreInProgress => (is => 'ro', isa => Bool, required => 1);
  has SourceBackupArn => (is => 'ro', isa => Str);
  has SourceTableArn => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{RestoreDateTime}) {
      $res{RestoreDateTime} = (map {
            "$_"
      } ($args->{RestoreDateTime}))[0];
    }
    if (exists $args->{RestoreInProgress}) {
      $res{RestoreInProgress} = (map {
            0 + !!$_
      } ($args->{RestoreInProgress}))[0];
    }
    if (exists $args->{SourceBackupArn}) {
      $res{SourceBackupArn} = (map {
            "$_"
      } ($args->{SourceBackupArn}))[0];
    }
    if (exists $args->{SourceTableArn}) {
      $res{SourceTableArn} = (map {
            "$_"
      } ($args->{SourceTableArn}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "RestoreDateTime") {
        my $key = "RestoreDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "RestoreInProgress") {
        my $key = "RestoreInProgress";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "SourceBackupArn") {
        my $key = "SourceBackupArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "SourceTableArn") {
        my $key = "SourceTableArn";
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
    if (exists $self->{RestoreDateTime}) {
      $res{RestoreDateTime} = (map {
            "$_"
      } ($self->RestoreDateTime))[0];
    }
    if (exists $self->{RestoreInProgress}) {
      $res{RestoreInProgress} = (map {
            0 + !!$_
      } ($self->RestoreInProgress))[0];
    }
    if (exists $self->{SourceBackupArn}) {
      $res{SourceBackupArn} = (map {
            "$_"
      } ($self->SourceBackupArn))[0];
    }
    if (exists $self->{SourceTableArn}) {
      $res{SourceTableArn} = (map {
            "$_"
      } ($self->SourceTableArn))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{RestoreDateTime}) {
      $res{RestoreDateTime} = (map {
            "$_"
      } ($self->RestoreDateTime))[0];
    }
    if (exists $self->{RestoreInProgress}) {
      $res{RestoreInProgress} = (map {
            $_ ? \1 : \0
      } ($self->RestoreInProgress))[0];
    }
    if (exists $self->{SourceBackupArn}) {
      $res{SourceBackupArn} = (map {
            "$_"
      } ($self->SourceBackupArn))[0];
    }
    if (exists $self->{SourceTableArn}) {
      $res{SourceTableArn} = (map {
            "$_"
      } ($self->SourceTableArn))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{RestoreDateTime}) {
      my $key = "${prefix}RestoreDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->RestoreDateTime;
    }

    if (exists $self->{RestoreInProgress}) {
      my $key = "${prefix}RestoreInProgress";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->RestoreInProgress;
    }

    if (exists $self->{SourceBackupArn}) {
      my $key = "${prefix}SourceBackupArn";
      do {
            $res->{$key} = "$_";
      } for $self->SourceBackupArn;
    }

    if (exists $self->{SourceTableArn}) {
      my $key = "${prefix}SourceTableArn";
      do {
            $res->{$key} = "$_";
      } for $self->SourceTableArn;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::RestoreSummary

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::RestoreSummary object:

  $service_obj->Method(Att1 => { RestoreDateTime => $value, ..., SourceTableArn => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::RestoreSummary object:

  $result = $service_obj->Method(...);
  $result->Att1->RestoreDateTime

=head1 DESCRIPTION

Contains details for the restore.

=head1 ATTRIBUTES


=head2 B<REQUIRED> RestoreDateTime => Str

  Point in time or source backup time.


=head2 B<REQUIRED> RestoreInProgress => Bool

  Indicates if a restore is in progress or not.


=head2 SourceBackupArn => Str

  ARN of the backup from which the table was restored.


=head2 SourceTableArn => Str

  ARN of the source table of the backup that is being restored.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
