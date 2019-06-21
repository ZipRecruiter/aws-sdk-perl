package Paws::WorkMail::User;
  use Moose;
  has DisabledDate => (is => 'ro', isa => 'Str');
  has DisplayName => (is => 'ro', isa => 'Str');
  has Email => (is => 'ro', isa => 'Str');
  has EnabledDate => (is => 'ro', isa => 'Str');
  has Id => (is => 'ro', isa => 'Str');
  has Name => (is => 'ro', isa => 'Str');
  has State => (is => 'ro', isa => 'Str');
  has UserRole => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::WorkMail::User

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::WorkMail::User object:

  $service_obj->Method(Att1 => { DisabledDate => $value, ..., UserRole => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::WorkMail::User object:

  $result = $service_obj->Method(...);
  $result->Att1->DisabledDate

=head1 DESCRIPTION

The representation of an Amazon WorkMail user.

=head1 ATTRIBUTES


=head2 DisabledDate => Str

  The date indicating when the user was disabled from Amazon WorkMail
use.


=head2 DisplayName => Str

  The display name of the user.


=head2 Email => Str

  The email of the user.


=head2 EnabledDate => Str

  The date indicating when the user was enabled for Amazon WorkMail use.


=head2 Id => Str

  The identifier of the user.


=head2 Name => Str

  The name of the user.


=head2 State => Str

  The state of the user, which can be ENABLED, DISABLED, or DELETED.


=head2 UserRole => Str

  The role of the user.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::WorkMail>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
