package Paws::DynamoDB::KeysAndAttributes;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has AttributesToGet => (is => 'ro', isa => ArrayRef[Maybe[Str]]);
  has ConsistentRead => (is => 'ro', isa => Bool);
  has ExpressionAttributeNames => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ExpressionAttributeNameMap']);
  has Keys => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::Key']], required => 1);
  has ProjectionExpression => (is => 'ro', isa => Str);

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
    if (exists $args->{Keys}) {
      $res{Keys} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::Key' ? $_ : do {
                  require Paws::DynamoDB::Key;
                  Paws::DynamoDB::Key->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{Keys}))[0];
    }
    if (exists $args->{ProjectionExpression}) {
      $res{ProjectionExpression} = (map {
            "$_"
      } ($args->{ProjectionExpression}))[0];
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
      } elsif ($nodeName eq "Keys") {
        my $key = "Keys";
            do {
              my $tmp = $res->{$key} // [];
              do {
                require Paws::DynamoDB::Key;
                Paws::DynamoDB::Key->read_xml( $_, $res, $key );
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "ProjectionExpression") {
        my $key = "ProjectionExpression";
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
    if (exists $self->{Keys}) {
      $res{Keys} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->Keys))[0];
    }
    if (exists $self->{ProjectionExpression}) {
      $res{ProjectionExpression} = (map {
            "$_"
      } ($self->ProjectionExpression))[0];
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
    if (exists $self->{Keys}) {
      $res{Keys} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->Keys))[0];
    }
    if (exists $self->{ProjectionExpression}) {
      $res{ProjectionExpression} = (map {
            "$_"
      } ($self->ProjectionExpression))[0];
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

    if (exists $self->{Keys}) {
      my $key = "${prefix}Keys";
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
      } for $self->Keys;
    }

    if (exists $self->{ProjectionExpression}) {
      my $key = "${prefix}ProjectionExpression";
      do {
            $res->{$key} = "$_";
      } for $self->ProjectionExpression;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::KeysAndAttributes

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::KeysAndAttributes object:

  $service_obj->Method(Att1 => { AttributesToGet => $value, ..., ProjectionExpression => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::KeysAndAttributes object:

  $result = $service_obj->Method(...);
  $result->Att1->AttributesToGet

=head1 DESCRIPTION

Represents a set of primary keys and, for each key, the attributes to
retrieve from the table.

For each primary key, you must provide I<all> of the key attributes.
For example, with a simple primary key, you only need to provide the
partition key. For a composite primary key, you must provide I<both>
the partition key and the sort key.

=head1 ATTRIBUTES


=head2 AttributesToGet => ArrayRef[Maybe[Str]]

  This is a legacy parameter. Use C<ProjectionExpression> instead. For
more information, see Legacy Conditional Parameters
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html)
in the I<Amazon DynamoDB Developer Guide>.


=head2 ConsistentRead => Bool

  The consistency of a read operation. If set to C<true>, then a strongly
consistent read is used; otherwise, an eventually consistent read is
used.


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


=head2 B<REQUIRED> Keys => ArrayRef[L<Paws::DynamoDB::Key>]

  The primary key attribute values that define the items and the
attributes associated with the items.


=head2 ProjectionExpression => Str

  A string that identifies one or more attributes to retrieve from the
table. These attributes can include scalars, sets, or elements of a
JSON document. The attributes in the C<ProjectionExpression> must be
separated by commas.

If no attribute names are specified, then all attributes will be
returned. If any of the requested attributes are not found, they will
not appear in the result.

For more information, see Accessing Item Attributes
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
in the I<Amazon DynamoDB Developer Guide>.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
