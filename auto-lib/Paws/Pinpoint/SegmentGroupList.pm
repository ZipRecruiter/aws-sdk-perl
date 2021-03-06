package Paws::Pinpoint::SegmentGroupList;
  use Moose;
  has Groups => (is => 'ro', isa => 'ArrayRef[Paws::Pinpoint::SegmentGroup]');
  has Include => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Pinpoint::SegmentGroupList

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Pinpoint::SegmentGroupList object:

  $service_obj->Method(Att1 => { Groups => $value, ..., Include => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Pinpoint::SegmentGroupList object:

  $result = $service_obj->Method(...);
  $result->Att1->Groups

=head1 DESCRIPTION

Specifies the settings that define the relationships between segment
groups for a segment.

=head1 ATTRIBUTES


=head2 Groups => ArrayRef[L<Paws::Pinpoint::SegmentGroup>]

  An array that defines the set of segment criteria to evaluate when
handling segment groups for the segment.


=head2 Include => Str

  Specifies how to handle multiple segment groups for the segment. For
example, if the segment includes three segment groups, whether the
resulting segment includes endpoints that match all, any, or none of
the segment groups.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Pinpoint>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

