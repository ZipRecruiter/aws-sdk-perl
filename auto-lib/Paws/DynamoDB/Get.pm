package Paws::DynamoDB::Get;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has ExpressionAttributeNames => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ExpressionAttributeNameMap']);
  has Key => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Key'], required => 1);
  has ProjectionExpression => (is => 'ro', isa => Str);
  has TableName => (is => 'ro', isa => Str, required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
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

Paws::DynamoDB::Get

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::Get object:

  $service_obj->Method(Att1 => { ExpressionAttributeNames => $value, ..., TableName => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::Get object:

  $result = $service_obj->Method(...);
  $result->Att1->ExpressionAttributeNames

=head1 DESCRIPTION

Specifies an item and related attribute values to retrieve in a
C<TransactGetItem> object.

=head1 ATTRIBUTES


=head2 ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>

  One or more substitution tokens for attribute names in the
ProjectionExpression parameter.


=head2 B<REQUIRED> Key => L<Paws::DynamoDB::Key>

  A map of attribute names to C<AttributeValue> objects that specifies
the primary key of the item to retrieve.


=head2 ProjectionExpression => Str

  A string that identifies one or more attributes of the specified item
to retrieve from the table. The attributes in the expression must be
separated by commas. If no attribute names are specified, then all
attributes of the specified item are returned. If any of the requested
attributes are not found, they do not appear in the result.


=head2 B<REQUIRED> TableName => Str

  The name of the table from which to retrieve the specified item.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
