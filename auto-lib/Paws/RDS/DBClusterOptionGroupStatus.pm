package Paws::RDS::DBClusterOptionGroupStatus;
  use Moose;
  has DBClusterOptionGroupName => (is => 'ro', isa => 'Str');
  has Status => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::RDS::DBClusterOptionGroupStatus

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::RDS::DBClusterOptionGroupStatus object:

  $service_obj->Method(Att1 => { DBClusterOptionGroupName => $value, ..., Status => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::RDS::DBClusterOptionGroupStatus object:

  $result = $service_obj->Method(...);
  $result->Att1->DBClusterOptionGroupName

=head1 DESCRIPTION

Contains status information for a DB cluster option group.

=head1 ATTRIBUTES


=head2 DBClusterOptionGroupName => Str

  Specifies the name of the DB cluster option group.


=head2 Status => Str

  Specifies the status of the DB cluster option group.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::RDS>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
