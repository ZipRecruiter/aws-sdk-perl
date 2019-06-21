package Paws::EC2::CapacityReservationTargetResponse;
  use Moose;
  has CapacityReservationId => (is => 'ro', isa => 'Str', request_name => 'capacityReservationId', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::EC2::CapacityReservationTargetResponse

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::EC2::CapacityReservationTargetResponse object:

  $service_obj->Method(Att1 => { CapacityReservationId => $value, ..., CapacityReservationId => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::EC2::CapacityReservationTargetResponse object:

  $result = $service_obj->Method(...);
  $result->Att1->CapacityReservationId

=head1 DESCRIPTION

Describes a target Capacity Reservation.

=head1 ATTRIBUTES


=head2 CapacityReservationId => Str

  The ID of the Capacity Reservation.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::EC2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
