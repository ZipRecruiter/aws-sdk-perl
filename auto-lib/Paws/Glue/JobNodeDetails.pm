package Paws::Glue::JobNodeDetails;
  use Moose;
  has JobRuns => (is => 'ro', isa => 'ArrayRef[Paws::Glue::JobRun]');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Glue::JobNodeDetails

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Glue::JobNodeDetails object:

  $service_obj->Method(Att1 => { JobRuns => $value, ..., JobRuns => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Glue::JobNodeDetails object:

  $result = $service_obj->Method(...);
  $result->Att1->JobRuns

=head1 DESCRIPTION

The details of a Job node present in the workflow.

=head1 ATTRIBUTES


=head2 JobRuns => ArrayRef[L<Paws::Glue::JobRun>]

  The information for the job runs represented by the job node.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Glue>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

