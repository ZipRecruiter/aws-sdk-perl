
package Paws::Route53::ChangeResourceRecordSetsResponse;
  use Moose;
  has ChangeInfo => (is => 'ro', isa => 'Paws::Route53::ChangeInfo', required => 1);

  has _request_id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Route53::ChangeResourceRecordSetsResponse

=head1 ATTRIBUTES


=head2 B<REQUIRED> ChangeInfo => L<Paws::Route53::ChangeInfo>

A complex type that contains information about changes made to your
hosted zone.

This element contains an ID that you use when performing a GetChange
(https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html)
action to get detailed information about the change.




=cut

