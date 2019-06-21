package Paws::EC2::LoadBalancersConfig;
  use Moose;
  has ClassicLoadBalancersConfig => (is => 'ro', isa => 'Paws::EC2::ClassicLoadBalancersConfig', request_name => 'classicLoadBalancersConfig', traits => ['NameInRequest']);
  has TargetGroupsConfig => (is => 'ro', isa => 'Paws::EC2::TargetGroupsConfig', request_name => 'targetGroupsConfig', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::EC2::LoadBalancersConfig

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::EC2::LoadBalancersConfig object:

  $service_obj->Method(Att1 => { ClassicLoadBalancersConfig => $value, ..., TargetGroupsConfig => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::EC2::LoadBalancersConfig object:

  $result = $service_obj->Method(...);
  $result->Att1->ClassicLoadBalancersConfig

=head1 DESCRIPTION

Describes the Classic Load Balancers and target groups to attach to a
Spot Fleet request.

=head1 ATTRIBUTES


=head2 ClassicLoadBalancersConfig => L<Paws::EC2::ClassicLoadBalancersConfig>

  The Classic Load Balancers.


=head2 TargetGroupsConfig => L<Paws::EC2::TargetGroupsConfig>

  The target groups.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::EC2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
