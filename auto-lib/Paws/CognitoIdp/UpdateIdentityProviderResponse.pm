
package Paws::CognitoIdp::UpdateIdentityProviderResponse;
  use Moose;
  has IdentityProvider => (is => 'ro', isa => 'Paws::CognitoIdp::IdentityProviderType', required => 1);

  has _request_id => (is => 'ro', isa => 'Str');

### main pod documentation begin ###

=head1 NAME

Paws::CognitoIdp::UpdateIdentityProviderResponse

=head1 ATTRIBUTES


=head2 B<REQUIRED> IdentityProvider => L<Paws::CognitoIdp::IdentityProviderType>

The identity provider object.


=head2 _request_id => Str


=cut

1;
