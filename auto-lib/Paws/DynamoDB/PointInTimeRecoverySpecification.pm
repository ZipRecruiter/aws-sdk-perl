package Paws::DynamoDB::PointInTimeRecoverySpecification;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has PointInTimeRecoveryEnabled => (is => 'ro', isa => Bool, required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{PointInTimeRecoveryEnabled}) {
      $res{PointInTimeRecoveryEnabled} = (map {
            0 + !!$_
      } ($args->{PointInTimeRecoveryEnabled}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "PointInTimeRecoveryEnabled") {
        my $key = "PointInTimeRecoveryEnabled";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{PointInTimeRecoveryEnabled}) {
      $res{PointInTimeRecoveryEnabled} = (map {
            0 + !!$_
      } ($self->PointInTimeRecoveryEnabled))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{PointInTimeRecoveryEnabled}) {
      $res{PointInTimeRecoveryEnabled} = (map {
            $_ ? \1 : \0
      } ($self->PointInTimeRecoveryEnabled))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{PointInTimeRecoveryEnabled}) {
      my $key = "${prefix}PointInTimeRecoveryEnabled";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->PointInTimeRecoveryEnabled;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::PointInTimeRecoverySpecification

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::PointInTimeRecoverySpecification object:

  $service_obj->Method(Att1 => { PointInTimeRecoveryEnabled => $value, ..., PointInTimeRecoveryEnabled => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::PointInTimeRecoverySpecification object:

  $result = $service_obj->Method(...);
  $result->Att1->PointInTimeRecoveryEnabled

=head1 DESCRIPTION

Represents the settings used to enable point in time recovery.

=head1 ATTRIBUTES


=head2 B<REQUIRED> PointInTimeRecoveryEnabled => Bool

  Indicates whether point in time recovery is enabled (true) or disabled
(false) on the table.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
