
package Paws::DynamoDB::UpdateGlobalTableOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has GlobalTableDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::GlobalTableDescription']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{GlobalTableDescription}) {
      $res{GlobalTableDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::GlobalTableDescription' ? $_ : do {
              require Paws::DynamoDB::GlobalTableDescription;
              Paws::DynamoDB::GlobalTableDescription->new_with_coercions($_);
              }
      } ($args->{GlobalTableDescription}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "GlobalTableDescription") {
        my $key = "GlobalTableDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::GlobalTableDescription;
              Paws::DynamoDB::GlobalTableDescription->new_from_xml($_);
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
    if (exists $self->{GlobalTableDescription}) {
      $res{GlobalTableDescription} = (map {
            $_->to_hash_data
      } ($self->GlobalTableDescription))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{GlobalTableDescription}) {
      $res{GlobalTableDescription} = (map {
            $_->to_json_data
      } ($self->GlobalTableDescription))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{GlobalTableDescription}) {
      my $key = "${prefix}GlobalTableDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->GlobalTableDescription;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::UpdateGlobalTableOutput

=head1 ATTRIBUTES


=head2 GlobalTableDescription => L<Paws::DynamoDB::GlobalTableDescription>

Contains the details of the global table.


=head2 _request_id => Str


=cut

