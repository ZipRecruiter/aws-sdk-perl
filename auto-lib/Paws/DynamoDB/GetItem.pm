
package Paws::DynamoDB::GetItem;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has AttributesToGet => (is => 'ro', isa => ArrayRef[Maybe[Str]]);
  has ConsistentRead => (is => 'ro', isa => Bool);
  has ExpressionAttributeNames => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ExpressionAttributeNameMap']);
  has Key => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Key'], required => 1);
  has ProjectionExpression => (is => 'ro', isa => Str);
  has ReturnConsumedCapacity => (is => 'ro', isa => Str);
  has TableName => (is => 'ro', isa => Str, required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'GetItem');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::GetItemOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{AttributesToGet}) {
      $res{AttributesToGet} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($args->{AttributesToGet}))[0];
    }
    if (exists $args->{ConsistentRead}) {
      $res{ConsistentRead} = (map {
            0 + !!$_
      } ($args->{ConsistentRead}))[0];
    }
    if (exists $args->{ExpressionAttributeNames}) {
      $res{ExpressionAttributeNames} = (map {
            ref($_) eq 'Paws::DynamoDB::ExpressionAttributeNameMap' ? $_ : do {
              require Paws::DynamoDB::ExpressionAttributeNameMap;
              Paws::DynamoDB::ExpressionAttributeNameMap->new_with_coercions($_);
              }
      } ($args->{ExpressionAttributeNames}))[0];
    }
    if (exists $args->{Key}) {
      $res{Key} = (map {
            ref($_) eq 'Paws::DynamoDB::Key' ? $_ : do {
              require Paws::DynamoDB::Key;
              Paws::DynamoDB::Key->new_with_coercions($_);
              }
      } ($args->{Key}))[0];
    }
    if (exists $args->{ProjectionExpression}) {
      $res{ProjectionExpression} = (map {
            "$_"
      } ($args->{ProjectionExpression}))[0];
    }
    if (exists $args->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($args->{ReturnConsumedCapacity}))[0];
    }
    if (exists $args->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($args->{TableName}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "AttributesToGet") {
        my $key = "AttributesToGet";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ConsistentRead") {
        my $key = "ConsistentRead";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "ExpressionAttributeNames") {
        my $key = "ExpressionAttributeNames";
            do {
              require Paws::DynamoDB::ExpressionAttributeNameMap;
              Paws::DynamoDB::ExpressionAttributeNameMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "Key") {
        my $key = "Key";
            do {
              require Paws::DynamoDB::Key;
              Paws::DynamoDB::Key->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "ProjectionExpression") {
        my $key = "ProjectionExpression";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ReturnConsumedCapacity") {
        my $key = "ReturnConsumedCapacity";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableName") {
        my $key = "TableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AttributesToGet}) {
      $res{AttributesToGet} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->AttributesToGet))[0];
    }
    if (exists $self->{ConsistentRead}) {
      $res{ConsistentRead} = (map {
            0 + !!$_
      } ($self->ConsistentRead))[0];
    }
    if (exists $self->{ExpressionAttributeNames}) {
      $res{ExpressionAttributeNames} = (map {
            $_->to_hash_data
      } ($self->ExpressionAttributeNames))[0];
    }
    if (exists $self->{Key}) {
      $res{Key} = (map {
            $_->to_hash_data
      } ($self->Key))[0];
    }
    if (exists $self->{ProjectionExpression}) {
      $res{ProjectionExpression} = (map {
            "$_"
      } ($self->ProjectionExpression))[0];
    }
    if (exists $self->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($self->ReturnConsumedCapacity))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AttributesToGet}) {
      $res{AttributesToGet} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->AttributesToGet))[0];
    }
    if (exists $self->{ConsistentRead}) {
      $res{ConsistentRead} = (map {
            $_ ? \1 : \0
      } ($self->ConsistentRead))[0];
    }
    if (exists $self->{ExpressionAttributeNames}) {
      $res{ExpressionAttributeNames} = (map {
            $_->to_json_data
      } ($self->ExpressionAttributeNames))[0];
    }
    if (exists $self->{Key}) {
      $res{Key} = (map {
            $_->to_json_data
      } ($self->Key))[0];
    }
    if (exists $self->{ProjectionExpression}) {
      $res{ProjectionExpression} = (map {
            "$_"
      } ($self->ProjectionExpression))[0];
    }
    if (exists $self->{ReturnConsumedCapacity}) {
      $res{ReturnConsumedCapacity} = (map {
            "$_"
      } ($self->ReturnConsumedCapacity))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{AttributesToGet}) {
      my $key = "${prefix}AttributesToGet";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              $res->{$key} = defined($val) ? "$val" : undef;
            }
      } for $self->AttributesToGet;
    }

    if (exists $self->{ConsistentRead}) {
      my $key = "${prefix}ConsistentRead";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->ConsistentRead;
    }

    if (exists $self->{ExpressionAttributeNames}) {
      my $key = "${prefix}ExpressionAttributeNames";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ExpressionAttributeNames;
    }

    if (exists $self->{Key}) {
      my $key = "${prefix}Key";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Key;
    }

    if (exists $self->{ProjectionExpression}) {
      my $key = "${prefix}ProjectionExpression";
      do {
            $res->{$key} = "$_";
      } for $self->ProjectionExpression;
    }

    if (exists $self->{ReturnConsumedCapacity}) {
      my $key = "${prefix}ReturnConsumedCapacity";
      do {
            $res->{$key} = "$_";
      } for $self->ReturnConsumedCapacity;
    }

    if (exists $self->{TableName}) {
      my $key = "${prefix}TableName";
      do {
            $res->{$key} = "$_";
      } for $self->TableName;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::GetItem - Arguments for method GetItem on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method GetItem on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method GetItem.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to GetItem.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
# To read an item from a table
# This example retrieves an item from the Music table. The table has a partition
# key and a sort key (Artist and SongTitle), so you must specify both of these
# attributes.
    my $GetItemOutput = $dynamodb->GetItem(
      'Key' => {
        'Artist' => {
          'S' => 'Acme Band'
        },
        'SongTitle' => {
          'S' => 'Happy Day'
        }
      },
      'TableName' => 'Music'
    );

    # Results:
    my $Item = $GetItemOutput->Item;

    # Returns a L<Paws::DynamoDB::GetItemOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/GetItem>

=head1 ATTRIBUTES


=head2 AttributesToGet => ArrayRef[Maybe[Str]]

This is a legacy parameter. Use C<ProjectionExpression> instead. For
more information, see AttributesToGet
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html)
in the I<Amazon DynamoDB Developer Guide>.



=head2 ConsistentRead => Bool

Determines the read consistency model: If set to C<true>, then the
operation uses strongly consistent reads; otherwise, the operation uses
eventually consistent reads.



=head2 ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>

One or more substitution tokens for attribute names in an expression.
The following are some use cases for using C<ExpressionAttributeNames>:

=over

=item *

To access an attribute whose name conflicts with a DynamoDB reserved
word.

=item *

To create a placeholder for repeating occurrences of an attribute name
in an expression.

=item *

To prevent special characters in an attribute name from being
misinterpreted in an expression.

=back

Use the B<#> character in an expression to dereference an attribute
name. For example, consider the following attribute name:

=over

=item *

C<Percentile>

=back

The name of this attribute conflicts with a reserved word, so it cannot
be used directly in an expression. (For the complete list of reserved
words, see Reserved Words
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
in the I<Amazon DynamoDB Developer Guide>). To work around this, you
could specify the following for C<ExpressionAttributeNames>:

=over

=item *

C<{"#P":"Percentile"}>

=back

You could then use this substitution in an expression, as in this
example:

=over

=item *

C<#P = :val>

=back

Tokens that begin with the B<:> character are I<expression attribute
values>, which are placeholders for the actual value at runtime.

For more information on expression attribute names, see Accessing Item
Attributes
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
in the I<Amazon DynamoDB Developer Guide>.



=head2 B<REQUIRED> Key => L<Paws::DynamoDB::Key>

A map of attribute names to C<AttributeValue> objects, representing the
primary key of the item to retrieve.

For the primary key, you must provide all of the attributes. For
example, with a simple primary key, you only need to provide a value
for the partition key. For a composite primary key, you must provide
values for both the partition key and the sort key.



=head2 ProjectionExpression => Str

A string that identifies one or more attributes to retrieve from the
table. These attributes can include scalars, sets, or elements of a
JSON document. The attributes in the expression must be separated by
commas.

If no attribute names are specified, then all attributes will be
returned. If any of the requested attributes are not found, they will
not appear in the result.

For more information, see Accessing Item Attributes
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
in the I<Amazon DynamoDB Developer Guide>.



=head2 ReturnConsumedCapacity => Str



Valid values are: C<"INDEXES">, C<"TOTAL">, C<"NONE">

=head2 B<REQUIRED> TableName => Str

The name of the table containing the requested item.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method GetItem in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

