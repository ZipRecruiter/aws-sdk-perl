package Paws::ApiGatewayV2::Models;
  use Moose;
  has Items => (is => 'ro', isa => 'ArrayRef[Paws::ApiGatewayV2::Model]', request_name => 'items', traits => ['NameInRequest']);
  has NextToken => (is => 'ro', isa => 'Str', request_name => 'nextToken', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::ApiGatewayV2::Models

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::ApiGatewayV2::Models object:

  $service_obj->Method(Att1 => { Items => $value, ..., NextToken => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::ApiGatewayV2::Models object:

  $result = $service_obj->Method(...);
  $result->Att1->Items

=head1 DESCRIPTION

Represents a collection of data models. See Create Models and Mapping
Templates for Request and Response Mappings
(https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html).

=head1 ATTRIBUTES


=head2 Items => ArrayRef[L<Paws::ApiGatewayV2::Model>]

  The elements from this collection.


=head2 NextToken => Str

  The next page of elements from this collection. Not valid for the last
element of the collection.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::ApiGatewayV2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

