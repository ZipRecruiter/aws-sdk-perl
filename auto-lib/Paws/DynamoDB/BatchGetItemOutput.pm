
package Paws::DynamoDB::BatchGetItemOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has ConsumedCapacity => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ConsumedCapacity']]);
  has Responses => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::BatchGetResponseMap']);
  has UnprocessedKeys => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::BatchGetRequestMap']);

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
    if (exists $args->{Responses}) {
      $res{Responses} = (map {
            ref($_) eq 'Paws::DynamoDB::BatchGetResponseMap' ? $_ : do {
              require Paws::DynamoDB::BatchGetResponseMap;
              Paws::DynamoDB::BatchGetResponseMap->new_with_coercions($_);
              }
      } ($args->{Responses}))[0];
    }
    if (exists $args->{UnprocessedKeys}) {
      $res{UnprocessedKeys} = (map {
            ref($_) eq 'Paws::DynamoDB::BatchGetRequestMap' ? $_ : do {
              require Paws::DynamoDB::BatchGetRequestMap;
              Paws::DynamoDB::BatchGetRequestMap->new_with_coercions($_);
              }
      } ($args->{UnprocessedKeys}))[0];
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
      } elsif ($nodeName eq "Responses") {
        my $key = "Responses";
            do {
              require Paws::DynamoDB::BatchGetResponseMap;
              Paws::DynamoDB::BatchGetResponseMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "UnprocessedKeys") {
        my $key = "UnprocessedKeys";
            do {
              require Paws::DynamoDB::BatchGetRequestMap;
              Paws::DynamoDB::BatchGetRequestMap->read_xml( $_, $res, $key );
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
    if (exists $self->{Responses}) {
      $res{Responses} = (map {
            $_->to_hash_data
      } ($self->Responses))[0];
    }
    if (exists $self->{UnprocessedKeys}) {
      $res{UnprocessedKeys} = (map {
            $_->to_hash_data
      } ($self->UnprocessedKeys))[0];
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
    if (exists $self->{Responses}) {
      $res{Responses} = (map {
            $_->to_json_data
      } ($self->Responses))[0];
    }
    if (exists $self->{UnprocessedKeys}) {
      $res{UnprocessedKeys} = (map {
            $_->to_json_data
      } ($self->UnprocessedKeys))[0];
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

    if (exists $self->{Responses}) {
      my $key = "${prefix}Responses";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Responses;
    }

    if (exists $self->{UnprocessedKeys}) {
      my $key = "${prefix}UnprocessedKeys";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->UnprocessedKeys;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::BatchGetItemOutput

=head1 ATTRIBUTES


=head2 ConsumedCapacity => ArrayRef[L<Paws::DynamoDB::ConsumedCapacity>]

The read capacity units consumed by the entire C<BatchGetItem>
operation.

Each element consists of:

=over

=item *

C<TableName> - The table that consumed the provisioned throughput.

=item *

C<CapacityUnits> - The total number of capacity units consumed.

=back



=head2 Responses => L<Paws::DynamoDB::BatchGetResponseMap>

A map of table name to a list of items. Each object in C<Responses>
consists of a table name, along with a map of attribute data consisting
of the data type and attribute value.


=head2 UnprocessedKeys => L<Paws::DynamoDB::BatchGetRequestMap>

A map of tables and their respective keys that were not processed with
the current response. The C<UnprocessedKeys> value is in the same form
as C<RequestItems>, so the value can be provided directly to a
subsequent C<BatchGetItem> operation. For more information, see
C<RequestItems> in the Request Parameters section.

Each element consists of:

=over

=item *

C<Keys> - An array of primary key attribute values that define specific
items in the table.

=item *

C<ProjectionExpression> - One or more attributes to be retrieved from
the table or index. By default, all attributes are returned. If a
requested attribute is not found, it does not appear in the result.

=item *

C<ConsistentRead> - The consistency of a read operation. If set to
C<true>, then a strongly consistent read is used; otherwise, an
eventually consistent read is used.

=back

If there are no unprocessed keys remaining, the response contains an
empty C<UnprocessedKeys> map.


=head2 _request_id => Str


=cut

