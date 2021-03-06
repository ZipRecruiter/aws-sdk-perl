package Paws::ManagedBlockchain::VoteSummary;
  use Moose;
  has MemberId => (is => 'ro', isa => 'Str');
  has MemberName => (is => 'ro', isa => 'Str');
  has Vote => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::ManagedBlockchain::VoteSummary

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::ManagedBlockchain::VoteSummary object:

  $service_obj->Method(Att1 => { MemberId => $value, ..., Vote => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::ManagedBlockchain::VoteSummary object:

  $result = $service_obj->Method(...);
  $result->Att1->MemberId

=head1 DESCRIPTION

Properties of an individual vote that a member cast for a proposal.

=head1 ATTRIBUTES


=head2 MemberId => Str

  The unique identifier of the member that cast the vote.


=head2 MemberName => Str

  The name of the member that cast the vote.


=head2 Vote => Str

  The vote value, either C<YES> or C<NO>.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::ManagedBlockchain>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

