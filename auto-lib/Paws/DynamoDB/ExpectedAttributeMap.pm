package Paws::DynamoDB::ExpectedAttributeMap;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::MapStr';

  has Map => (is => 'ro', isa => HashRef[InstanceOf['Paws::DynamoDB::ExpectedAttributeValue']]);

  sub new_with_coercions {
    my ($class, $args) = @_;
    return $class->new({
      Map => {
        map {
          ( $_ => (map {
            ref($_) eq 'Paws::DynamoDB::ExpectedAttributeValue' ? $_ : do {
              require Paws::DynamoDB::ExpectedAttributeValue;
              Paws::DynamoDB::ExpectedAttributeValue->new_with_coercions($_);
              }
          } ($args->{$_}))[0] );
        } keys %$args,
      }
    });
  }

  sub to_json_data {
    my ($self) = @_;
    return {
      map {
        ( $_ => (map {
          $_->to_json_data
        } ($self->Map->{$_}))[0] );
      } keys %{$self->Map}
    };
  }

  sub to_hash_data {
    my ($self) = @_;
    return {
      map {
        ( $_ => (map {
          $_->to_hash_data
        } ($self->Map->{$_}))[0] );
      } keys %{$self->Map}
    };
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";

    my $map = $self->Map;

    my $i = 1;
    for my $map_key (keys %$map) {
      $res->{"${prefix}${i}.Name"} = $map_key;
      my $key = "${prefix}${i}.Value";
      do {
          $_->to_parameter_data( $res, $key );
      } for $map->{$map_key};
      $i++;
    }

    return $res;
  }

  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ExpectedAttributeMap

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ExpectedAttributeMap object:

  $service_obj->Method(Att1 => { key1 => $value, ..., keyN => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ExpectedAttributeMap object:

  $result = $service_obj->Method(...);
  $result->Att1->Map->{ key1 }

=head1 DESCRIPTION

This class has no description

=head1 ATTRIBUTES

=head2 Map => L<Paws::DynamoDB::ExpectedAttributeValue>

Use the Map method to retrieve a HashRef to the map

=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

