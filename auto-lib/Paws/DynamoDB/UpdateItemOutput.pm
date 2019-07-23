
package Paws::DynamoDB::UpdateItemOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has Attributes => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AttributeMap']);
  has ConsumedCapacity => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ConsumedCapacity']);
  has ItemCollectionMetrics => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ItemCollectionMetrics']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Attributes}) {
      $res{Attributes} = (map {
            ref($_) eq 'Paws::DynamoDB::AttributeMap' ? $_ : do {
              require Paws::DynamoDB::AttributeMap;
              Paws::DynamoDB::AttributeMap->new_with_coercions($_);
              }
      } ($args->{Attributes}))[0];
    }
    if (exists $args->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            ref($_) eq 'Paws::DynamoDB::ConsumedCapacity' ? $_ : do {
              require Paws::DynamoDB::ConsumedCapacity;
              Paws::DynamoDB::ConsumedCapacity->new_with_coercions($_);
              }
      } ($args->{ConsumedCapacity}))[0];
    }
    if (exists $args->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            ref($_) eq 'Paws::DynamoDB::ItemCollectionMetrics' ? $_ : do {
              require Paws::DynamoDB::ItemCollectionMetrics;
              Paws::DynamoDB::ItemCollectionMetrics->new_with_coercions($_);
              }
      } ($args->{ItemCollectionMetrics}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Attributes") {
        my $key = "Attributes";
            do {
              require Paws::DynamoDB::AttributeMap;
              Paws::DynamoDB::AttributeMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "ConsumedCapacity") {
        my $key = "ConsumedCapacity";
            $res->{$key} = do {
              require Paws::DynamoDB::ConsumedCapacity;
              Paws::DynamoDB::ConsumedCapacity->new_from_xml($_);
            };
      } elsif ($nodeName eq "ItemCollectionMetrics") {
        my $key = "ItemCollectionMetrics";
            $res->{$key} = do {
              require Paws::DynamoDB::ItemCollectionMetrics;
              Paws::DynamoDB::ItemCollectionMetrics->new_from_xml($_);
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
    if (exists $self->{Attributes}) {
      $res{Attributes} = (map {
            $_->to_hash_data
      } ($self->Attributes))[0];
    }
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            $_->to_hash_data
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            $_->to_hash_data
      } ($self->ItemCollectionMetrics))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Attributes}) {
      $res{Attributes} = (map {
            $_->to_json_data
      } ($self->Attributes))[0];
    }
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            $_->to_json_data
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            $_->to_json_data
      } ($self->ItemCollectionMetrics))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Attributes}) {
      my $key = "${prefix}Attributes";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Attributes;
    }

    if (exists $self->{ConsumedCapacity}) {
      my $key = "${prefix}ConsumedCapacity";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ConsumedCapacity;
    }

    if (exists $self->{ItemCollectionMetrics}) {
      my $key = "${prefix}ItemCollectionMetrics";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ItemCollectionMetrics;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::UpdateItemOutput

=head1 ATTRIBUTES


=head2 Attributes => L<Paws::DynamoDB::AttributeMap>

A map of attribute values as they appear before or after the
C<UpdateItem> operation, as determined by the C<ReturnValues>
parameter.

The C<Attributes> map is only present if C<ReturnValues> was specified
as something other than C<NONE> in the request. Each element represents
one attribute.


=head2 ConsumedCapacity => L<Paws::DynamoDB::ConsumedCapacity>

The capacity units consumed by the C<UpdateItem> operation. The data
returned includes the total provisioned throughput consumed, along with
statistics for the table and any indexes involved in the operation.
C<ConsumedCapacity> is only returned if the C<ReturnConsumedCapacity>
parameter was specified. For more information, see Provisioned
Throughput
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
in the I<Amazon DynamoDB Developer Guide>.


=head2 ItemCollectionMetrics => L<Paws::DynamoDB::ItemCollectionMetrics>

Information about item collections, if any, that were affected by the
C<UpdateItem> operation. C<ItemCollectionMetrics> is only returned if
the C<ReturnItemCollectionMetrics> parameter was specified. If the
table does not have any local secondary indexes, this information is
not returned in the response.

Each C<ItemCollectionMetrics> element consists of:

=over

=item *

C<ItemCollectionKey> - The partition key value of the item collection.
This is the same as the partition key value of the item itself.

=item *

C<SizeEstimateRangeGB> - An estimate of item collection size, in
gigabytes. This value is a two-element array containing a lower bound
and an upper bound for the estimate. The estimate includes the size of
all the items in the table, plus the size of all attributes projected
into all of the local secondary indexes on that table. Use this
estimate to measure whether a local secondary index is approaching its
size limit.

The estimate is subject to change over time; therefore, do not rely on
the precision or accuracy of the estimate.

=back



=head2 _request_id => Str


=cut

