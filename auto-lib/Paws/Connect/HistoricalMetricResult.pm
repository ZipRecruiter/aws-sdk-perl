package Paws::Connect::HistoricalMetricResult;
  use Moose;
  has Collections => (is => 'ro', isa => 'ArrayRef[Paws::Connect::HistoricalMetricData]');
  has Dimensions => (is => 'ro', isa => 'Paws::Connect::Dimensions');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Connect::HistoricalMetricResult

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Connect::HistoricalMetricResult object:

  $service_obj->Method(Att1 => { Collections => $value, ..., Dimensions => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Connect::HistoricalMetricResult object:

  $result = $service_obj->Method(...);
  $result->Att1->Collections

=head1 DESCRIPTION

The metrics data returned from a C<GetMetricData> operation.

=head1 ATTRIBUTES


=head2 Collections => ArrayRef[L<Paws::Connect::HistoricalMetricData>]

  A list of C<HistoricalMetricData> objects.


=head2 Dimensions => L<Paws::Connect::Dimensions>

  The C<Dimensions> for the metrics.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Connect>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

