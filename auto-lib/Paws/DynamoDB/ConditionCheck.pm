package Paws::DynamoDB::ConditionCheck;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has ConditionExpression => (is => 'ro', isa => Str, required => 1);
  has ExpressionAttributeNames => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ExpressionAttributeNameMap']);
  has ExpressionAttributeValues => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ExpressionAttributeValueMap']);
  has Key => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Key'], required => 1);
  has ReturnValuesOnConditionCheckFailure => (is => 'ro', isa => Str);
  has TableName => (is => 'ro', isa => Str, required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ConditionExpression}) {
      $res{ConditionExpression} = (map {
            "$_"
      } ($args->{ConditionExpression}))[0];
    }
    if (exists $args->{ExpressionAttributeNames}) {
      $res{ExpressionAttributeNames} = (map {
            ref($_) eq 'Paws::DynamoDB::ExpressionAttributeNameMap' ? $_ : do {
              require Paws::DynamoDB::ExpressionAttributeNameMap;
              Paws::DynamoDB::ExpressionAttributeNameMap->new_with_coercions($_);
              }
      } ($args->{ExpressionAttributeNames}))[0];
    }
    if (exists $args->{ExpressionAttributeValues}) {
      $res{ExpressionAttributeValues} = (map {
            ref($_) eq 'Paws::DynamoDB::ExpressionAttributeValueMap' ? $_ : do {
              require Paws::DynamoDB::ExpressionAttributeValueMap;
              Paws::DynamoDB::ExpressionAttributeValueMap->new_with_coercions($_);
              }
      } ($args->{ExpressionAttributeValues}))[0];
    }
    if (exists $args->{Key}) {
      $res{Key} = (map {
            ref($_) eq 'Paws::DynamoDB::Key' ? $_ : do {
              require Paws::DynamoDB::Key;
              Paws::DynamoDB::Key->new_with_coercions($_);
              }
      } ($args->{Key}))[0];
    }
    if (exists $args->{ReturnValuesOnConditionCheckFailure}) {
      $res{ReturnValuesOnConditionCheckFailure} = (map {
            "$_"
      } ($args->{ReturnValuesOnConditionCheckFailure}))[0];
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
      } elsif ($nodeName eq "ConditionExpression") {
        my $key = "ConditionExpression";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ExpressionAttributeNames") {
        my $key = "ExpressionAttributeNames";
            do {
              require Paws::DynamoDB::ExpressionAttributeNameMap;
              Paws::DynamoDB::ExpressionAttributeNameMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "ExpressionAttributeValues") {
        my $key = "ExpressionAttributeValues";
            do {
              require Paws::DynamoDB::ExpressionAttributeValueMap;
              Paws::DynamoDB::ExpressionAttributeValueMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "Key") {
        my $key = "Key";
            do {
              require Paws::DynamoDB::Key;
              Paws::DynamoDB::Key->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "ReturnValuesOnConditionCheckFailure") {
        my $key = "ReturnValuesOnConditionCheckFailure";
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
    if (exists $self->{ConditionExpression}) {
      $res{ConditionExpression} = (map {
            "$_"
      } ($self->ConditionExpression))[0];
    }
    if (exists $self->{ExpressionAttributeNames}) {
      $res{ExpressionAttributeNames} = (map {
            $_->to_hash_data
      } ($self->ExpressionAttributeNames))[0];
    }
    if (exists $self->{ExpressionAttributeValues}) {
      $res{ExpressionAttributeValues} = (map {
            $_->to_hash_data
      } ($self->ExpressionAttributeValues))[0];
    }
    if (exists $self->{Key}) {
      $res{Key} = (map {
            $_->to_hash_data
      } ($self->Key))[0];
    }
    if (exists $self->{ReturnValuesOnConditionCheckFailure}) {
      $res{ReturnValuesOnConditionCheckFailure} = (map {
            "$_"
      } ($self->ReturnValuesOnConditionCheckFailure))[0];
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
    if (exists $self->{ConditionExpression}) {
      $res{ConditionExpression} = (map {
            "$_"
      } ($self->ConditionExpression))[0];
    }
    if (exists $self->{ExpressionAttributeNames}) {
      $res{ExpressionAttributeNames} = (map {
            $_->to_json_data
      } ($self->ExpressionAttributeNames))[0];
    }
    if (exists $self->{ExpressionAttributeValues}) {
      $res{ExpressionAttributeValues} = (map {
            $_->to_json_data
      } ($self->ExpressionAttributeValues))[0];
    }
    if (exists $self->{Key}) {
      $res{Key} = (map {
            $_->to_json_data
      } ($self->Key))[0];
    }
    if (exists $self->{ReturnValuesOnConditionCheckFailure}) {
      $res{ReturnValuesOnConditionCheckFailure} = (map {
            "$_"
      } ($self->ReturnValuesOnConditionCheckFailure))[0];
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


    if (exists $self->{ConditionExpression}) {
      my $key = "${prefix}ConditionExpression";
      do {
            $res->{$key} = "$_";
      } for $self->ConditionExpression;
    }

    if (exists $self->{ExpressionAttributeNames}) {
      my $key = "${prefix}ExpressionAttributeNames";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ExpressionAttributeNames;
    }

    if (exists $self->{ExpressionAttributeValues}) {
      my $key = "${prefix}ExpressionAttributeValues";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ExpressionAttributeValues;
    }

    if (exists $self->{Key}) {
      my $key = "${prefix}Key";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Key;
    }

    if (exists $self->{ReturnValuesOnConditionCheckFailure}) {
      my $key = "${prefix}ReturnValuesOnConditionCheckFailure";
      do {
            $res->{$key} = "$_";
      } for $self->ReturnValuesOnConditionCheckFailure;
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

Paws::DynamoDB::ConditionCheck

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ConditionCheck object:

  $service_obj->Method(Att1 => { ConditionExpression => $value, ..., TableName => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ConditionCheck object:

  $result = $service_obj->Method(...);
  $result->Att1->ConditionExpression

=head1 DESCRIPTION

Represents a request to perform a check that an item exists or to check
the condition of specific attributes of the item..

=head1 ATTRIBUTES


=head2 B<REQUIRED> ConditionExpression => Str

  A condition that must be satisfied in order for a conditional update to
succeed.


=head2 ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>

  One or more substitution tokens for attribute names in an expression.


=head2 ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>

  One or more values that can be substituted in an expression.


=head2 B<REQUIRED> Key => L<Paws::DynamoDB::Key>

  The primary key of the item to be checked. Each element consists of an
attribute name and a value for that attribute.


=head2 ReturnValuesOnConditionCheckFailure => Str

  Use C<ReturnValuesOnConditionCheckFailure> to get the item attributes
if the C<ConditionCheck> condition fails. For
C<ReturnValuesOnConditionCheckFailure>, the valid values are: NONE and
ALL_OLD.


=head2 B<REQUIRED> TableName => Str

  Name of the table for the check item request.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
