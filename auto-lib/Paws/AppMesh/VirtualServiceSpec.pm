package Paws::AppMesh::VirtualServiceSpec;
  use Moose;
  has Provider => (is => 'ro', isa => 'Paws::AppMesh::VirtualServiceProvider', request_name => 'provider', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::AppMesh::VirtualServiceSpec

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::AppMesh::VirtualServiceSpec object:

  $service_obj->Method(Att1 => { Provider => $value, ..., Provider => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::AppMesh::VirtualServiceSpec object:

  $result = $service_obj->Method(...);
  $result->Att1->Provider

=head1 DESCRIPTION

An object representing the specification of a virtual service.

=head1 ATTRIBUTES


=head2 Provider => L<Paws::AppMesh::VirtualServiceProvider>

  The App Mesh object that is acting as the provider for a virtual
service. You can specify a single virtual node or virtual router.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::AppMesh>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

