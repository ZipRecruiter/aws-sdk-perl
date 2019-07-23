package Paws::DynamoDB::ContinuousBackupsDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has ContinuousBackupsStatus => (is => 'ro', isa => Str, required => 1);
  has PointInTimeRecoveryDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::PointInTimeRecoveryDescription']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ContinuousBackupsStatus}) {
      $res{ContinuousBackupsStatus} = (map {
            "$_"
      } ($args->{ContinuousBackupsStatus}))[0];
    }
    if (exists $args->{PointInTimeRecoveryDescription}) {
      $res{PointInTimeRecoveryDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::PointInTimeRecoveryDescription' ? $_ : do {
              require Paws::DynamoDB::PointInTimeRecoveryDescription;
              Paws::DynamoDB::PointInTimeRecoveryDescription->new_with_coercions($_);
              }
      } ($args->{PointInTimeRecoveryDescription}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ContinuousBackupsStatus") {
        my $key = "ContinuousBackupsStatus";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "PointInTimeRecoveryDescription") {
        my $key = "PointInTimeRecoveryDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::PointInTimeRecoveryDescription;
              Paws::DynamoDB::PointInTimeRecoveryDescription->new_from_xml($_);
            };

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ContinuousBackupsStatus}) {
      $res{ContinuousBackupsStatus} = (map {
            "$_"
      } ($self->ContinuousBackupsStatus))[0];
    }
    if (exists $self->{PointInTimeRecoveryDescription}) {
      $res{PointInTimeRecoveryDescription} = (map {
            $_->to_hash_data
      } ($self->PointInTimeRecoveryDescription))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ContinuousBackupsStatus}) {
      $res{ContinuousBackupsStatus} = (map {
            "$_"
      } ($self->ContinuousBackupsStatus))[0];
    }
    if (exists $self->{PointInTimeRecoveryDescription}) {
      $res{PointInTimeRecoveryDescription} = (map {
            $_->to_json_data
      } ($self->PointInTimeRecoveryDescription))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ContinuousBackupsStatus}) {
      my $key = "${prefix}ContinuousBackupsStatus";
      do {
            $res->{$key} = "$_";
      } for $self->ContinuousBackupsStatus;
    }

    if (exists $self->{PointInTimeRecoveryDescription}) {
      my $key = "${prefix}PointInTimeRecoveryDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->PointInTimeRecoveryDescription;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ContinuousBackupsDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ContinuousBackupsDescription object:

  $service_obj->Method(Att1 => { ContinuousBackupsStatus => $value, ..., PointInTimeRecoveryDescription => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ContinuousBackupsDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->ContinuousBackupsStatus

=head1 DESCRIPTION

Represents the continuous backups and point in time recovery settings
on the table.

=head1 ATTRIBUTES


=head2 B<REQUIRED> ContinuousBackupsStatus => Str

  C<ContinuousBackupsStatus> can be one of the following states: ENABLED,
DISABLED


=head2 PointInTimeRecoveryDescription => L<Paws::DynamoDB::PointInTimeRecoveryDescription>

  The description of the point in time recovery settings applied to the
table.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
