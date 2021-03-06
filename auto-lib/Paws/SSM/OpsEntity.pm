package Paws::SSM::OpsEntity;
  use Moose;
  has Data => (is => 'ro', isa => 'Paws::SSM::OpsEntityItemMap');
  has Id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::SSM::OpsEntity

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::SSM::OpsEntity object:

  $service_obj->Method(Att1 => { Data => $value, ..., Id => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::SSM::OpsEntity object:

  $result = $service_obj->Method(...);
  $result->Att1->Data

=head1 DESCRIPTION

The result of the query.

=head1 ATTRIBUTES


=head2 Data => L<Paws::SSM::OpsEntityItemMap>

  The data returned by the query.


=head2 Id => Str

  The query ID.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::SSM>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

