
package Paws::DynamoDB::TransactGetItems;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has ReturnConsumedCapacity => (is => 'ro', isa => Str);
  has TransactItems => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::TransactGetItem']], required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'TransactGetItems');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::TransactGetItemsOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($args->{ReturnConsumedCapacity}))[0];
    }
    if (exists $args->{TransactItems}) {
      $res{TransactItems} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::TransactGetItem' ? $_ : do {
                  require Paws::DynamoDB::TransactGetItem;
                  Paws::DynamoDB::TransactGetItem->new_with_coercions($_);
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
      } elsif ($nodeName eq "ReturnConsumedCapacity") {
        my $key = "ReturnConsumedCapacity";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TransactItems") {
        my $key = "TransactItems";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::TransactGetItem;
                Paws::DynamoDB::TransactGetItem->new_from_xml($_);
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
    if (exists $self->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($self->ReturnConsumedCapacity))[0];
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
    if (exists $self->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($self->ReturnConsumedCapacity))[0];
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


    if (exists $self->{ReturnConsumedCapacity}) {
      my $key = "${prefix}ReturnConsumedCapacity";
      do {
            $res->{$key} = "$_";
      } for $self->ReturnConsumedCapacity;
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

Paws::DynamoDB::TransactGetItems - Arguments for method TransactGetItems on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method TransactGetItems on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method TransactGetItems.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to TransactGetItems.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $TransactGetItemsOutput = $dynamodb->TransactGetItems(
      TransactItems => [
        {
          Get => {
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
            TableName                => 'MyTableName',    # min: 3, max: 255
            ExpressionAttributeNames => {
              'MyExpressionAttributeNameVariable' =>
                'MyAttributeName',                        # , value: max: 65535
            },    # OPTIONAL
            ProjectionExpression => 'MyProjectionExpression',    # OPTIONAL
          },

        },
        ...
      ],
      ReturnConsumedCapacity => 'INDEXES',                       # OPTIONAL
    );

    # Results:
    my $ConsumedCapacity = $TransactGetItemsOutput->ConsumedCapacity;
    my $Responses        = $TransactGetItemsOutput->Responses;

    # Returns a L<Paws::DynamoDB::TransactGetItemsOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/TransactGetItems>

=head1 ATTRIBUTES


=head2 ReturnConsumedCapacity => Str

A value of C<TOTAL> causes consumed capacity information to be
returned, and a value of C<NONE> prevents that information from being
returned. No other value is valid.

Valid values are: C<"INDEXES">, C<"TOTAL">, C<"NONE">

=head2 B<REQUIRED> TransactItems => ArrayRef[L<Paws::DynamoDB::TransactGetItem>]

An ordered array of up to 10 C<TransactGetItem> objects, each of which
contains a C<Get> structure.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method TransactGetItems in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

