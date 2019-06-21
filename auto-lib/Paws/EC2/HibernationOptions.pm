package Paws::EC2::HibernationOptions;
  use Moose;
  has Configured => (is => 'ro', isa => 'Bool', request_name => 'configured', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::EC2::HibernationOptions

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::EC2::HibernationOptions object:

  $service_obj->Method(Att1 => { Configured => $value, ..., Configured => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::EC2::HibernationOptions object:

  $result = $service_obj->Method(...);
  $result->Att1->Configured

=head1 DESCRIPTION

Indicates whether your instance is configured for hibernation. This
parameter is valid only if the instance meets the hibernation
prerequisites
(https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#hibernating-prerequisites).
Hibernation is currently supported only for Amazon Linux. For more
information, see Hibernate Your Instance
(https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html) in
the I<Amazon Elastic Compute Cloud User Guide>.

=head1 ATTRIBUTES


=head2 Configured => Bool

  If this parameter is set to C<true>, your instance is enabled for
hibernation; otherwise, it is not enabled for hibernation.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::EC2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
