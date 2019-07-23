
package Paws::DynamoDB::DescribeTimeToLiveOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has TimeToLiveDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::TimeToLiveDescription']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{TimeToLiveDescription}) {
      $res{TimeToLiveDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::TimeToLiveDescription' ? $_ : do {
              require Paws::DynamoDB::TimeToLiveDescription;
              Paws::DynamoDB::TimeToLiveDescription->new_with_coercions($_);
              }
      } ($args->{TimeToLiveDescription}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "TimeToLiveDescription") {
        my $key = "TimeToLiveDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::TimeToLiveDescription;
              Paws::DynamoDB::TimeToLiveDescription->new_from_xml($_);
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
    if (exists $self->{TimeToLiveDescription}) {
      $res{TimeToLiveDescription} = (map {
            $_->to_hash_data
      } ($self->TimeToLiveDescription))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{TimeToLiveDescription}) {
      $res{TimeToLiveDescription} = (map {
            $_->to_json_data
      } ($self->TimeToLiveDescription))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{TimeToLiveDescription}) {
      my $key = "${prefix}TimeToLiveDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->TimeToLiveDescription;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DescribeTimeToLiveOutput

=head1 ATTRIBUTES


=head2 TimeToLiveDescription => L<Paws::DynamoDB::TimeToLiveDescription>




=head2 _request_id => Str


=cut

