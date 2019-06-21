
package Paws::DS::CreateAliasResult;
  use Moose;
  has Alias => (is => 'ro', isa => 'Str');
  has DirectoryId => (is => 'ro', isa => 'Str');

  has _request_id => (is => 'ro', isa => 'Str');

### main pod documentation begin ###

=head1 NAME

Paws::DS::CreateAliasResult

=head1 ATTRIBUTES


=head2 Alias => Str

The alias for the directory.


=head2 DirectoryId => Str

The identifier of the directory.


=head2 _request_id => Str


=cut

1;
