package Paws::DynamoDB::AttributeDefinition;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has AttributeName => (is => 'ro', isa => Str, required => 1);
  has AttributeType => (is => 'ro', isa => Str, required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{AttributeName}) {
      $res{AttributeName} = (map {
            "$_"
      } ($args->{AttributeName}))[0];
    }
    if (exists $args->{AttributeType}) {
      $res{AttributeType} = (map {
            "$_"
      } ($args->{AttributeType}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "AttributeName") {
        my $key = "AttributeName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "AttributeType") {
        my $key = "AttributeType";
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
    if (exists $self->{AttributeName}) {
      $res{AttributeName} = (map {
            "$_"
      } ($self->AttributeName))[0];
    }
    if (exists $self->{AttributeType}) {
      $res{AttributeType} = (map {
            "$_"
      } ($self->AttributeType))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AttributeName}) {
      $res{AttributeName} = (map {
            "$_"
      } ($self->AttributeName))[0];
    }
    if (exists $self->{AttributeType}) {
      $res{AttributeType} = (map {
            "$_"
      } ($self->AttributeType))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{AttributeName}) {
      my $key = "${prefix}AttributeName";
      do {
            $res->{$key} = "$_";
      } for $self->AttributeName;
    }

    if (exists $self->{AttributeType}) {
      my $key = "${prefix}AttributeType";
      do {
            $res->{$key} = "$_";
      } for $self->AttributeType;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::AttributeDefinition

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::AttributeDefinition object:

  $service_obj->Method(Att1 => { AttributeName => $value, ..., AttributeType => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::AttributeDefinition object:

  $result = $service_obj->Method(...);
  $result->Att1->AttributeName

=head1 DESCRIPTION

Represents an attribute for describing the key schema for the table and
indexes.

=head1 ATTRIBUTES


=head2 B<REQUIRED> AttributeName => Str

  A name for the attribute.


=head2 B<REQUIRED> AttributeType => Str

  The data type for the attribute, where:

=over

=item *

C<S> - the attribute is of type String

=item *

C<N> - the attribute is of type Number

=item *

C<B> - the attribute is of type Binary

=back




=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
