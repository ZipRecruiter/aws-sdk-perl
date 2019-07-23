
package Paws::DynamoDB::DescribeEndpointsResponse;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has Endpoints => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::Endpoint']], required => 1);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Endpoints}) {
      $res{Endpoints} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::Endpoint' ? $_ : do {
                  require Paws::DynamoDB::Endpoint;
                  Paws::DynamoDB::Endpoint->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{Endpoints}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Endpoints") {
        my $key = "Endpoints";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::Endpoint;
                Paws::DynamoDB::Endpoint->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Endpoints}) {
      $res{Endpoints} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->Endpoints))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Endpoints}) {
      $res{Endpoints} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->Endpoints))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Endpoints}) {
      my $key = "${prefix}Endpoints";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $_->to_parameter_data( $res, $key );
                }
                for $val;
            }
      } for $self->Endpoints;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DescribeEndpointsResponse

=head1 ATTRIBUTES


=head2 B<REQUIRED> Endpoints => ArrayRef[L<Paws::DynamoDB::Endpoint>]

List of endpoints.


=head2 _request_id => Str


=cut

