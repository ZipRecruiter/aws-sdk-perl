
package Paws::Chime::GetVoiceConnectorTerminationResponse;
  use Moose;
  has Termination => (is => 'ro', isa => 'Paws::Chime::Termination');

  has _request_id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Chime::GetVoiceConnectorTerminationResponse

=head1 ATTRIBUTES


=head2 Termination => L<Paws::Chime::Termination>

The termination setting details.


=head2 _request_id => Str


=cut

