package Paws::DynamoDB::AttributeValue;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has B => (is => 'ro', isa => Str);
  has BOOL => (is => 'ro', isa => Bool);
  has BS => (is => 'ro', isa => ArrayRef[Maybe[Str]]);
  has L => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::AttributeValue']]);
  has M => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::MapAttributeValue']);
  has N => (is => 'ro', isa => Str);
  has NS => (is => 'ro', isa => ArrayRef[Maybe[Str]]);
  has NULL => (is => 'ro', isa => Bool);
  has S => (is => 'ro', isa => Str);
  has SS => (is => 'ro', isa => ArrayRef[Maybe[Str]]);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{B}) {
      $res{B} = (map {
            "$_"
      } ($args->{B}))[0];
    }
    if (exists $args->{BOOL}) {
      $res{BOOL} = (map {
            0 + !!$_
      } ($args->{BOOL}))[0];
    }
    if (exists $args->{BS}) {
      $res{BS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($args->{BS}))[0];
    }
    if (exists $args->{L}) {
      $res{L} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::AttributeValue' ? $_ : do {
                  require Paws::DynamoDB::AttributeValue;
                  Paws::DynamoDB::AttributeValue->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{L}))[0];
    }
    if (exists $args->{M}) {
      $res{M} = (map {
            ref($_) eq 'Paws::DynamoDB::MapAttributeValue' ? $_ : do {
              require Paws::DynamoDB::MapAttributeValue;
              Paws::DynamoDB::MapAttributeValue->new_with_coercions($_);
              }
      } ($args->{M}))[0];
    }
    if (exists $args->{N}) {
      $res{N} = (map {
            "$_"
      } ($args->{N}))[0];
    }
    if (exists $args->{NS}) {
      $res{NS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($args->{NS}))[0];
    }
    if (exists $args->{NULL}) {
      $res{NULL} = (map {
            0 + !!$_
      } ($args->{NULL}))[0];
    }
    if (exists $args->{S}) {
      $res{S} = (map {
            "$_"
      } ($args->{S}))[0];
    }
    if (exists $args->{SS}) {
      $res{SS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($args->{SS}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "B") {
        my $key = "B";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "BOOL") {
        my $key = "BOOL";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "BS") {
        my $key = "BS";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "L") {
        my $key = "L";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::AttributeValue;
                Paws::DynamoDB::AttributeValue->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "M") {
        my $key = "M";
            do {
              require Paws::DynamoDB::MapAttributeValue;
              Paws::DynamoDB::MapAttributeValue->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "N") {
        my $key = "N";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "NS") {
        my $key = "NS";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "NULL") {
        my $key = "NULL";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "S") {
        my $key = "S";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "SS") {
        my $key = "SS";
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
    if (exists $self->{B}) {
      $res{B} = (map {
            "$_"
      } ($self->B))[0];
    }
    if (exists $self->{BOOL}) {
      $res{BOOL} = (map {
            0 + !!$_
      } ($self->BOOL))[0];
    }
    if (exists $self->{BS}) {
      $res{BS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->BS))[0];
    }
    if (exists $self->{L}) {
      $res{L} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->L))[0];
    }
    if (exists $self->{M}) {
      $res{M} = (map {
            $_->to_hash_data
      } ($self->M))[0];
    }
    if (exists $self->{N}) {
      $res{N} = (map {
            "$_"
      } ($self->N))[0];
    }
    if (exists $self->{NS}) {
      $res{NS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->NS))[0];
    }
    if (exists $self->{NULL}) {
      $res{NULL} = (map {
            0 + !!$_
      } ($self->NULL))[0];
    }
    if (exists $self->{S}) {
      $res{S} = (map {
            "$_"
      } ($self->S))[0];
    }
    if (exists $self->{SS}) {
      $res{SS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->SS))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{B}) {
      $res{B} = (map {
            "$_"
      } ($self->B))[0];
    }
    if (exists $self->{BOOL}) {
      $res{BOOL} = (map {
            $_ ? \1 : \0
      } ($self->BOOL))[0];
    }
    if (exists $self->{BS}) {
      $res{BS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->BS))[0];
    }
    if (exists $self->{L}) {
      $res{L} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->L))[0];
    }
    if (exists $self->{M}) {
      $res{M} = (map {
            $_->to_json_data
      } ($self->M))[0];
    }
    if (exists $self->{N}) {
      $res{N} = (map {
            "$_"
      } ($self->N))[0];
    }
    if (exists $self->{NS}) {
      $res{NS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->NS))[0];
    }
    if (exists $self->{NULL}) {
      $res{NULL} = (map {
            $_ ? \1 : \0
      } ($self->NULL))[0];
    }
    if (exists $self->{S}) {
      $res{S} = (map {
            "$_"
      } ($self->S))[0];
    }
    if (exists $self->{SS}) {
      $res{SS} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->SS))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{B}) {
      my $key = "${prefix}B";
      do {
            $res->{$key} = "$_";
      } for $self->B;
    }

    if (exists $self->{BOOL}) {
      my $key = "${prefix}BOOL";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->BOOL;
    }

    if (exists $self->{BS}) {
      my $key = "${prefix}BS";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              $res->{$key} = defined($val) ? "$val" : undef;
            }
      } for $self->BS;
    }

    if (exists $self->{L}) {
      my $key = "${prefix}L";
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
      } for $self->L;
    }

    if (exists $self->{M}) {
      my $key = "${prefix}M";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->M;
    }

    if (exists $self->{N}) {
      my $key = "${prefix}N";
      do {
            $res->{$key} = "$_";
      } for $self->N;
    }

    if (exists $self->{NS}) {
      my $key = "${prefix}NS";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              $res->{$key} = defined($val) ? "$val" : undef;
            }
      } for $self->NS;
    }

    if (exists $self->{NULL}) {
      my $key = "${prefix}NULL";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->NULL;
    }

    if (exists $self->{S}) {
      my $key = "${prefix}S";
      do {
            $res->{$key} = "$_";
      } for $self->S;
    }

    if (exists $self->{SS}) {
      my $key = "${prefix}SS";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              $res->{$key} = defined($val) ? "$val" : undef;
            }
      } for $self->SS;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::AttributeValue

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::AttributeValue object:

  $service_obj->Method(Att1 => { B => $value, ..., SS => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::AttributeValue object:

  $result = $service_obj->Method(...);
  $result->Att1->B

=head1 DESCRIPTION

Represents the data for an attribute.

Each attribute value is described as a name-value pair. The name is the
data type, and the value is the data itself.

For more information, see Data Types
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes)
in the I<Amazon DynamoDB Developer Guide>.

=head1 ATTRIBUTES


=head2 B => Str

  An attribute of type Binary. For example:

C<"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk">


=head2 BOOL => Bool

  An attribute of type Boolean. For example:

C<"BOOL": true>


=head2 BS => ArrayRef[Maybe[Str]]

  An attribute of type Binary Set. For example:

C<"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]>


=head2 L => ArrayRef[L<Paws::DynamoDB::AttributeValue>]

  An attribute of type List. For example:

C<"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N", "3.14159"}]>


=head2 M => L<Paws::DynamoDB::MapAttributeValue>

  An attribute of type Map. For example:

C<"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}>


=head2 N => Str

  An attribute of type Number. For example:

C<"N": "123.45">

Numbers are sent across the network to DynamoDB as strings, to maximize
compatibility across languages and libraries. However, DynamoDB treats
them as number type attributes for mathematical operations.


=head2 NS => ArrayRef[Maybe[Str]]

  An attribute of type Number Set. For example:

C<"NS": ["42.2", "-19", "7.5", "3.14"]>

Numbers are sent across the network to DynamoDB as strings, to maximize
compatibility across languages and libraries. However, DynamoDB treats
them as number type attributes for mathematical operations.


=head2 NULL => Bool

  An attribute of type Null. For example:

C<"NULL": true>


=head2 S => Str

  An attribute of type String. For example:

C<"S": "Hello">


=head2 SS => ArrayRef[Maybe[Str]]

  An attribute of type String Set. For example:

C<"SS": ["Giraffe", "Hippo" ,"Zebra"]>



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
