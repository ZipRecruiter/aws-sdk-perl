
package Paws::DynamoDB::UpdateTimeToLiveOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has TimeToLiveSpecification => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::TimeToLiveSpecification']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{TimeToLiveSpecification}) {
      $res{TimeToLiveSpecification} = (map {
            ref($_) eq 'Paws::DynamoDB::TimeToLiveSpecification' ? $_ : do {
              require Paws::DynamoDB::TimeToLiveSpecification;
              Paws::DynamoDB::TimeToLiveSpecification->new_with_coercions($_);
              }
      } ($args->{TimeToLiveSpecification}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "TimeToLiveSpecification") {
        my $key = "TimeToLiveSpecification";
            $res->{$key} = do {
              require Paws::DynamoDB::TimeToLiveSpecification;
              Paws::DynamoDB::TimeToLiveSpecification->new_from_xml($_);
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
    if (exists $self->{TimeToLiveSpecification}) {
      $res{TimeToLiveSpecification} = (map {
            $_->to_hash_data
      } ($self->TimeToLiveSpecification))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{TimeToLiveSpecification}) {
      $res{TimeToLiveSpecification} = (map {
            $_->to_json_data
      } ($self->TimeToLiveSpecification))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{TimeToLiveSpecification}) {
      my $key = "${prefix}TimeToLiveSpecification";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->TimeToLiveSpecification;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::UpdateTimeToLiveOutput

=head1 ATTRIBUTES


=head2 TimeToLiveSpecification => L<Paws::DynamoDB::TimeToLiveSpecification>

Represents the output of an C<UpdateTimeToLive> operation.


=head2 _request_id => Str


=cut

