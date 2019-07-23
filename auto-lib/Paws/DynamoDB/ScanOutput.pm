
package Paws::DynamoDB::ScanOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has ConsumedCapacity => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ConsumedCapacity']);
  has Count => (is => 'ro', isa => Int);
  has Items => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::AttributeMap']]);
  has LastEvaluatedKey => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Key']);
  has ScannedCount => (is => 'ro', isa => Int);

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
    if (exists $args->{Count}) {
      $res{Count} = (map {
            int($_)
      } ($args->{Count}))[0];
    }
    if (exists $args->{Items}) {
      $res{Items} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::AttributeMap' ? $_ : do {
                  require Paws::DynamoDB::AttributeMap;
                  Paws::DynamoDB::AttributeMap->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{Items}))[0];
    }
    if (exists $args->{LastEvaluatedKey}) {
      $res{LastEvaluatedKey} = (map {
            ref($_) eq 'Paws::DynamoDB::Key' ? $_ : do {
              require Paws::DynamoDB::Key;
              Paws::DynamoDB::Key->new_with_coercions($_);
              }
      } ($args->{LastEvaluatedKey}))[0];
    }
    if (exists $args->{ScannedCount}) {
      $res{ScannedCount} = (map {
            int($_)
      } ($args->{ScannedCount}))[0];
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
      } elsif ($nodeName eq "Count") {
        my $key = "Count";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "Items") {
        my $key = "Items";
            do {
              my $tmp = $res->{$key} // [];
              do {
                require Paws::DynamoDB::AttributeMap;
                Paws::DynamoDB::AttributeMap->read_xml( $_, $res, $key );
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "LastEvaluatedKey") {
        my $key = "LastEvaluatedKey";
            do {
              require Paws::DynamoDB::Key;
              Paws::DynamoDB::Key->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "ScannedCount") {
        my $key = "ScannedCount";
            $res->{$key} = int( $_->nodeValue // 0 );

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
    if (exists $self->{Count}) {
      $res{Count} = (map {
            int($_)
      } ($self->Count))[0];
    }
    if (exists $self->{Items}) {
      $res{Items} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->Items))[0];
    }
    if (exists $self->{LastEvaluatedKey}) {
      $res{LastEvaluatedKey} = (map {
            $_->to_hash_data
      } ($self->LastEvaluatedKey))[0];
    }
    if (exists $self->{ScannedCount}) {
      $res{ScannedCount} = (map {
            int($_)
      } ($self->ScannedCount))[0];
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
    if (exists $self->{Count}) {
      $res{Count} = (map {
            int($_)
      } ($self->Count))[0];
    }
    if (exists $self->{Items}) {
      $res{Items} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->Items))[0];
    }
    if (exists $self->{LastEvaluatedKey}) {
      $res{LastEvaluatedKey} = (map {
            $_->to_json_data
      } ($self->LastEvaluatedKey))[0];
    }
    if (exists $self->{ScannedCount}) {
      $res{ScannedCount} = (map {
            int($_)
      } ($self->ScannedCount))[0];
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

    if (exists $self->{Count}) {
      my $key = "${prefix}Count";
      do {
            $res->{$key} = int($_);
      } for $self->Count;
    }

    if (exists $self->{Items}) {
      my $key = "${prefix}Items";
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
      } for $self->Items;
    }

    if (exists $self->{LastEvaluatedKey}) {
      my $key = "${prefix}LastEvaluatedKey";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->LastEvaluatedKey;
    }

    if (exists $self->{ScannedCount}) {
      my $key = "${prefix}ScannedCount";
      do {
            $res->{$key} = int($_);
      } for $self->ScannedCount;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ScanOutput

=head1 ATTRIBUTES


=head2 ConsumedCapacity => L<Paws::DynamoDB::ConsumedCapacity>

The capacity units consumed by the C<Scan> operation. The data returned
includes the total provisioned throughput consumed, along with
statistics for the table and any indexes involved in the operation.
C<ConsumedCapacity> is only returned if the C<ReturnConsumedCapacity>
parameter was specified. For more information, see Provisioned
Throughput
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
in the I<Amazon DynamoDB Developer Guide>.


=head2 Count => Int

The number of items in the response.

If you set C<ScanFilter> in the request, then C<Count> is the number of
items returned after the filter was applied, and C<ScannedCount> is the
number of matching items before the filter was applied.

If you did not use a filter in the request, then C<Count> is the same
as C<ScannedCount>.


=head2 Items => ArrayRef[L<Paws::DynamoDB::AttributeMap>]

An array of item attributes that match the scan criteria. Each element
in this array consists of an attribute name and the value for that
attribute.


=head2 LastEvaluatedKey => L<Paws::DynamoDB::Key>

The primary key of the item where the operation stopped, inclusive of
the previous result set. Use this value to start a new operation,
excluding this value in the new request.

If C<LastEvaluatedKey> is empty, then the "last page" of results has
been processed and there is no more data to be retrieved.

If C<LastEvaluatedKey> is not empty, it does not necessarily mean that
there is more data in the result set. The only way to know when you
have reached the end of the result set is when C<LastEvaluatedKey> is
empty.


=head2 ScannedCount => Int

The number of items evaluated, before any C<ScanFilter> is applied. A
high C<ScannedCount> value with few, or no, C<Count> results indicates
an inefficient C<Scan> operation. For more information, see Count and
ScannedCount
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count)
in the I<Amazon DynamoDB Developer Guide>.

If you did not use a filter in the request, then C<ScannedCount> is the
same as C<Count>.


=head2 _request_id => Str


=cut

