
package Paws::SecurityHub::CreateInsightResponse;
  use Moose;
  has InsightArn => (is => 'ro', isa => 'Str', required => 1);

  has _request_id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::SecurityHub::CreateInsightResponse

=head1 ATTRIBUTES


=head2 B<REQUIRED> InsightArn => Str

The ARN of the insight created.


=head2 _request_id => Str


=cut

