
package Paws::DynamoDB::BatchWriteItemOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has ConsumedCapacity => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ConsumedCapacity']]);
  has ItemCollectionMetrics => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ItemCollectionMetricsPerTable']);
  has UnprocessedItems => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::BatchWriteItemRequestMap']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::ConsumedCapacity' ? $_ : do {
                  require Paws::DynamoDB::ConsumedCapacity;
                  Paws::DynamoDB::ConsumedCapacity->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{ConsumedCapacity}))[0];
    }
    if (exists $args->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            ref($_) eq 'Paws::DynamoDB::ItemCollectionMetricsPerTable' ? $_ : do {
              require Paws::DynamoDB::ItemCollectionMetricsPerTable;
              Paws::DynamoDB::ItemCollectionMetricsPerTable->new_with_coercions($_);
              }
      } ($args->{ItemCollectionMetrics}))[0];
    }
    if (exists $args->{UnprocessedItems}) {
      $res{UnprocessedItems} = (map {
            ref($_) eq 'Paws::DynamoDB::BatchWriteItemRequestMap' ? $_ : do {
              require Paws::DynamoDB::BatchWriteItemRequestMap;
              Paws::DynamoDB::BatchWriteItemRequestMap->new_with_coercions($_);
              }
      } ($args->{UnprocessedItems}))[0];
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
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ConsumedCapacity;
                Paws::DynamoDB::ConsumedCapacity->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "ItemCollectionMetrics") {
        my $key = "ItemCollectionMetrics";
            do {
              require Paws::DynamoDB::ItemCollectionMetricsPerTable;
              Paws::DynamoDB::ItemCollectionMetricsPerTable->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "UnprocessedItems") {
        my $key = "UnprocessedItems";
            do {
              require Paws::DynamoDB::BatchWriteItemRequestMap;
              Paws::DynamoDB::BatchWriteItemRequestMap->read_xml( $_, $res, $key );
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
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            $_->to_hash_data
      } ($self->ItemCollectionMetrics))[0];
    }
    if (exists $self->{UnprocessedItems}) {
      $res{UnprocessedItems} = (map {
            $_->to_hash_data
      } ($self->UnprocessedItems))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            $_->to_json_data
      } ($self->ItemCollectionMetrics))[0];
    }
    if (exists $self->{UnprocessedItems}) {
      $res{UnprocessedItems} = (map {
            $_->to_json_data
      } ($self->UnprocessedItems))[0];
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
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $_->to_parameter_data( $res, $key );
                }
                for $val;
            }
      } for $self->ConsumedCapacity;
    }

    if (exists $self->{ItemCollectionMetrics}) {
      my $key = "${prefix}ItemCollectionMetrics";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ItemCollectionMetrics;
    }

    if (exists $self->{UnprocessedItems}) {
      my $key = "${prefix}UnprocessedItems";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->UnprocessedItems;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::BatchWriteItemOutput

=head1 ATTRIBUTES


=head2 ConsumedCapacity => ArrayRef[L<Paws::DynamoDB::ConsumedCapacity>]

The capacity units consumed by the entire C<BatchWriteItem> operation.

Each element consists of:

=over

=item *

C<TableName> - The table that consumed the provisioned throughput.

=item *

C<CapacityUnits> - The total number of capacity units consumed.

=back



=head2 ItemCollectionMetrics => L<Paws::DynamoDB::ItemCollectionMetricsPerTable>

A list of tables that were processed by C<BatchWriteItem> and, for each
table, information about any item collections that were affected by
individual C<DeleteItem> or C<PutItem> operations.

Each entry consists of the following subelements:

=over

=item *

C<ItemCollectionKey> - The partition key value of the item collection.
This is the same as the partition key value of the item.

=item *

C<SizeEstimateRangeGB> - An estimate of item collection size, expressed
in GB. This is a two-element array containing a lower bound and an
upper bound for the estimate. The estimate includes the size of all the
items in the table, plus the size of all attributes projected into all
of the local secondary indexes on the table. Use this estimate to
measure whether a local secondary index is approaching its size limit.

The estimate is subject to change over time; therefore, do not rely on
the precision or accuracy of the estimate.

=back



=head2 UnprocessedItems => L<Paws::DynamoDB::BatchWriteItemRequestMap>

A map of tables and requests against those tables that were not
processed. The C<UnprocessedItems> value is in the same form as
C<RequestItems>, so you can provide this value directly to a subsequent
C<BatchGetItem> operation. For more information, see C<RequestItems> in
the Request Parameters section.

Each C<UnprocessedItems> entry consists of a table name and, for that
table, a list of operations to perform (C<DeleteRequest> or
C<PutRequest>).

=over

=item *

C<DeleteRequest> - Perform a C<DeleteItem> operation on the specified
item. The item to be deleted is identified by a C<Key> subelement:

=over

=item *

C<Key> - A map of primary key attribute values that uniquely identify
the item. Each entry in this map consists of an attribute name and an
attribute value.

=back

=item *

C<PutRequest> - Perform a C<PutItem> operation on the specified item.
The item to be put is identified by an C<Item> subelement:

=over

=item *

C<Item> - A map of attributes and their values. Each entry in this map
consists of an attribute name and an attribute value. Attribute values
must not be null; string and binary type attributes must have lengths
greater than zero; and set type attributes must not be empty. Requests
that contain empty values will be rejected with a
C<ValidationException> exception.

If you specify any attributes that are part of an index key, then the
data types for those attributes must match those of the schema in the
table's attribute definition.

=back

=back

If there are no unprocessed items remaining, the response contains an
empty C<UnprocessedItems> map.


=head2 _request_id => Str


=cut

