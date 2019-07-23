
package Paws::DynamoDB::TransactWriteItems;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has ClientRequestToken => (is => 'ro', isa => Str);
  has ReturnConsumedCapacity => (is => 'ro', isa => Str);
  has ReturnItemCollectionMetrics => (is => 'ro', isa => Str);
  has TransactItems => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::TransactWriteItem']], required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'TransactWriteItems');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::TransactWriteItemsOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ClientRequestToken}) {
      $res{ClientRequestToken} = (map {
            "$_"
      } ($args->{ClientRequestToken}))[0];
    }
    if (exists $args->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($args->{ReturnConsumedCapacity}))[0];
    }
    if (exists $args->{ReturnItemCollectionMetrics}) {
      $res{ReturnItemCollectionMetrics} = (map {
            "$_"
      } ($args->{ReturnItemCollectionMetrics}))[0];
    }
    if (exists $args->{TransactItems}) {
      $res{TransactItems} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::TransactWriteItem' ? $_ : do {
                  require Paws::DynamoDB::TransactWriteItem;
                  Paws::DynamoDB::TransactWriteItem->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{TransactItems}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ClientRequestToken") {
        my $key = "ClientRequestToken";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ReturnConsumedCapacity") {
        my $key = "ReturnConsumedCapacity";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ReturnItemCollectionMetrics") {
        my $key = "ReturnItemCollectionMetrics";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TransactItems") {
        my $key = "TransactItems";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::TransactWriteItem;
                Paws::DynamoDB::TransactWriteItem->new_from_xml($_);
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
    if (exists $self->{ClientRequestToken}) {
      $res{ClientRequestToken} = (map {
            "$_"
      } ($self->ClientRequestToken))[0];
    }
    if (exists $self->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($self->ReturnConsumedCapacity))[0];
    }
    if (exists $self->{ReturnItemCollectionMetrics}) {
      $res{ReturnItemCollectionMetrics} = (map {
            "$_"
      } ($self->ReturnItemCollectionMetrics))[0];
    }
    if (exists $self->{TransactItems}) {
      $res{TransactItems} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->TransactItems))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ClientRequestToken}) {
      $res{ClientRequestToken} = (map {
            "$_"
      } ($self->ClientRequestToken))[0];
    }
    if (exists $self->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($self->ReturnConsumedCapacity))[0];
    }
    if (exists $self->{ReturnItemCollectionMetrics}) {
      $res{ReturnItemCollectionMetrics} = (map {
            "$_"
      } ($self->ReturnItemCollectionMetrics))[0];
    }
    if (exists $self->{TransactItems}) {
      $res{TransactItems} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->TransactItems))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ClientRequestToken}) {
      my $key = "${prefix}ClientRequestToken";
      do {
            $res->{$key} = "$_";
      } for $self->ClientRequestToken;
    }

    if (exists $self->{ReturnConsumedCapacity}) {
      my $key = "${prefix}ReturnConsumedCapacity";
      do {
            $res->{$key} = "$_";
      } for $self->ReturnConsumedCapacity;
    }

    if (exists $self->{ReturnItemCollectionMetrics}) {
      my $key = "${prefix}ReturnItemCollectionMetrics";
      do {
            $res->{$key} = "$_";
      } for $self->ReturnItemCollectionMetrics;
    }

    if (exists $self->{TransactItems}) {
      my $key = "${prefix}TransactItems";
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
      } for $self->TransactItems;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::TransactWriteItems - Arguments for method TransactWriteItems on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method TransactWriteItems on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method TransactWriteItems.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to TransactWriteItems.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $TransactWriteItemsOutput = $dynamodb->TransactWriteItems(
      TransactItems => [
        {
          ConditionCheck => {
            ConditionExpression => 'MyConditionExpression',
            Key                 => {
              'MyAttributeName' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },    # key: max: 65535
            },
            TableName                => 'MyTableName',    # min: 3, max: 255
            ExpressionAttributeNames => {
              'MyExpressionAttributeNameVariable' =>
                'MyAttributeName',                        # , value: max: 65535
            },    # OPTIONAL
            ExpressionAttributeValues => {
              'MyExpressionAttributeValueVariable' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },
            },    # OPTIONAL
            ReturnValuesOnConditionCheckFailure =>
              'ALL_OLD',    # values: ALL_OLD, NONE; OPTIONAL
          },    # OPTIONAL
          Delete => {
            Key => {
              'MyAttributeName' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },    # key: max: 65535
            },
            TableName           => 'MyTableName',             # min: 3, max: 255
            ConditionExpression => 'MyConditionExpression',
            ExpressionAttributeNames => {
              'MyExpressionAttributeNameVariable' =>
                'MyAttributeName',    # , value: max: 65535
            },    # OPTIONAL
            ExpressionAttributeValues => {
              'MyExpressionAttributeValueVariable' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },
            },    # OPTIONAL
            ReturnValuesOnConditionCheckFailure =>
              'ALL_OLD',    # values: ALL_OLD, NONE; OPTIONAL
          },    # OPTIONAL
          Put => {
            Item => {
              'MyAttributeName' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },    # key: max: 65535
            },
            TableName           => 'MyTableName',             # min: 3, max: 255
            ConditionExpression => 'MyConditionExpression',
            ExpressionAttributeNames => {
              'MyExpressionAttributeNameVariable' =>
                'MyAttributeName',    # , value: max: 65535
            },    # OPTIONAL
            ExpressionAttributeValues => {
              'MyExpressionAttributeValueVariable' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },
            },    # OPTIONAL
            ReturnValuesOnConditionCheckFailure =>
              'ALL_OLD',    # values: ALL_OLD, NONE; OPTIONAL
          },    # OPTIONAL
          Update => {
            Key => {
              'MyAttributeName' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },    # key: max: 65535
            },
            TableName           => 'MyTableName',             # min: 3, max: 255
            UpdateExpression    => 'MyUpdateExpression',
            ConditionExpression => 'MyConditionExpression',
            ExpressionAttributeNames => {
              'MyExpressionAttributeNameVariable' =>
                'MyAttributeName',    # , value: max: 65535
            },    # OPTIONAL
            ExpressionAttributeValues => {
              'MyExpressionAttributeValueVariable' => {
                B    => 'BlobBinaryAttributeValue',    # OPTIONAL
                BOOL => 1,                             # OPTIONAL
                BS   => [
                  'BlobBinaryAttributeValue', ...      # OPTIONAL
                ],                                     # OPTIONAL
                L => [ <AttributeValue>, ... ],        # OPTIONAL
                M => {
                  'MyAttributeName' => <AttributeValue>,    # key: max: 65535
                },    # OPTIONAL
                N  => 'MyNumberAttributeValue',    # OPTIONAL
                NS => [
                  'MyNumberAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
                NULL => 1,                         # OPTIONAL
                S    => 'MyStringAttributeValue',  # OPTIONAL
                SS   => [
                  'MyStringAttributeValue', ...    # OPTIONAL
                ],                                 # OPTIONAL
              },
            },    # OPTIONAL
            ReturnValuesOnConditionCheckFailure =>
              'ALL_OLD',    # values: ALL_OLD, NONE; OPTIONAL
          },    # OPTIONAL
        },
        ...
      ],
      ClientRequestToken          => 'MyClientRequestToken',    # OPTIONAL
      ReturnConsumedCapacity      => 'INDEXES',                 # OPTIONAL
      ReturnItemCollectionMetrics => 'SIZE',                    # OPTIONAL
    );

    # Results:
    my $ConsumedCapacity = $TransactWriteItemsOutput->ConsumedCapacity;
    my $ItemCollectionMetrics =
      $TransactWriteItemsOutput->ItemCollectionMetrics;

    # Returns a L<Paws::DynamoDB::TransactWriteItemsOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/TransactWriteItems>

=head1 ATTRIBUTES


=head2 ClientRequestToken => Str

Providing a C<ClientRequestToken> makes the call to
C<TransactWriteItems> idempotent, meaning that multiple identical calls
have the same effect as one single call.

Although multiple identical calls using the same client request token
produce the same result on the server (no side effects), the responses
to the calls may not be the same. If the C<ReturnConsumedCapacityE<gt>>
parameter is set, then the initial C<TransactWriteItems> call returns
the amount of write capacity units consumed in making the changes, and
subsequent C<TransactWriteItems> calls with the same client token
return the amount of read capacity units consumed in reading the item.

A client request token is valid for 10 minutes after the first request
that uses it completes. After 10 minutes, any request with the same
client token is treated as a new request. Do not resubmit the same
request with the same client token for more than 10 minutes or the
result may not be idempotent.

If you submit a request with the same client token but a change in
other parameters within the 10 minute idempotency window, DynamoDB
returns an C<IdempotentParameterMismatch> exception.



=head2 ReturnConsumedCapacity => Str



Valid values are: C<"INDEXES">, C<"TOTAL">, C<"NONE">

=head2 ReturnItemCollectionMetrics => Str

Determines whether item collection metrics are returned. If set to
C<SIZE>, the response includes statistics about item collections (if
any), that were modified during the operation and are returned in the
response. If set to C<NONE> (the default), no statistics are returned.

Valid values are: C<"SIZE">, C<"NONE">

=head2 B<REQUIRED> TransactItems => ArrayRef[L<Paws::DynamoDB::TransactWriteItem>]

An ordered array of up to 10 C<TransactWriteItem> objects, each of
which contains a C<ConditionCheck>, C<Put>, C<Update>, or C<Delete>
object. These can operate on items in different tables, but the tables
must reside in the same AWS account and region, and no two of them can
operate on the same item.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method TransactWriteItems in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

