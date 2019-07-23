
package Paws::DynamoDB::GetItemOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has ConsumedCapacity => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ConsumedCapacity']);
  has Item => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AttributeMap']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            ref($_) eq 'Paws::DynamoDB::ConsumedCapacity' ? $_ : do {
              require Paws::DynamoDB::ConsumedCapacity;
              Paws::DynamoDB::ConsumedCapacity->new_with_coercions($_);
              }
      } ($args->{ConsumedCapacity}))[0];
    }
    if (exists $args->{Item}) {
      $res{Item} = (map {
            ref($_) eq 'Paws::DynamoDB::AttributeMap' ? $_ : do {
              require Paws::DynamoDB::AttributeMap;
              Paws::DynamoDB::AttributeMap->new_with_coercions($_);
              }
      } ($args->{Item}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ConsumedCapacity") {
        my $key = "ConsumedCapacity";
            $res->{$key} = do {
              require Paws::DynamoDB::ConsumedCapacity;
              Paws::DynamoDB::ConsumedCapacity->new_from_xml($_);
            };
      } elsif ($nodeName eq "Item") {
        my $key = "Item";
            do {
              require Paws::DynamoDB::AttributeMap;
              Paws::DynamoDB::AttributeMap->read_xml( $_, $res, $key );
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
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            $_->to_hash_data
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{Item}) {
      $res{Item} = (map {
            $_->to_hash_data
      } ($self->Item))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            $_->to_json_data
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{Item}) {
      $res{Item} = (map {
            $_->to_json_data
      } ($self->Item))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ConsumedCapacity}) {
      my $key = "${prefix}ConsumedCapacity";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ConsumedCapacity;
    }

    if (exists $self->{Item}) {
      my $key = "${prefix}Item";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Item;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::GetItemOutput

=head1 ATTRIBUTES


=head2 ConsumedCapacity => L<Paws::DynamoDB::ConsumedCapacity>

The capacity units consumed by the C<GetItem> operation. The data
returned includes the total provisioned throughput consumed, along with
statistics for the table and any indexes involved in the operation.
C<ConsumedCapacity> is only returned if the C<ReturnConsumedCapacity>
parameter was specified. For more information, see Provisioned
Throughput
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
in the I<Amazon DynamoDB Developer Guide>.


=head2 Item => L<Paws::DynamoDB::AttributeMap>

A map of attribute names to C<AttributeValue> objects, as specified by
C<ProjectionExpression>.


=head2 _request_id => Str


=cut

