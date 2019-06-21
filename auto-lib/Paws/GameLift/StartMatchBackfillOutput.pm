
package Paws::GameLift::StartMatchBackfillOutput;
  use Moose;
  has MatchmakingTicket => (is => 'ro', isa => 'Paws::GameLift::MatchmakingTicket');

  has _request_id => (is => 'ro', isa => 'Str');

### main pod documentation begin ###

=head1 NAME

Paws::GameLift::StartMatchBackfillOutput

=head1 ATTRIBUTES


=head2 MatchmakingTicket => L<Paws::GameLift::MatchmakingTicket>

Ticket representing the backfill matchmaking request. This object
includes the information in the request, ticket status, and match
results as generated during the matchmaking process.


=head2 _request_id => Str


=cut

1;
