package Paws::WorkDocs::PermissionInfo;
  use Moose;
  has Role => (is => 'ro', isa => 'Str');
  has Type => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::WorkDocs::PermissionInfo

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::WorkDocs::PermissionInfo object:

  $service_obj->Method(Att1 => { Role => $value, ..., Type => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::WorkDocs::PermissionInfo object:

  $result = $service_obj->Method(...);
  $result->Att1->Role

=head1 DESCRIPTION

Describes the permissions.

=head1 ATTRIBUTES


=head2 Role => Str

  The role of the user.


=head2 Type => Str

  The type of permissions.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::WorkDocs>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
