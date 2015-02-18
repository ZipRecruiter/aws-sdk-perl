
package Paws::IAM::GetPolicyResponse {
  use Moose;
  with 'Paws::API::ResultParser';
  has Policy => (is => 'ro', isa => 'Paws::IAM::Policy');

}
1;

### main pod documentation begin ###

=head1 NAME

Paws::IAM::GetPolicyResponse

=head1 ATTRIBUTES

=head2 Policy => Paws::IAM::Policy

  

Information about the policy.











=cut

