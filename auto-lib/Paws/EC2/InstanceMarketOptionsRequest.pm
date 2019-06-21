package Paws::EC2::InstanceMarketOptionsRequest;
  use Moose;
  has MarketType => (is => 'ro', isa => 'Str');
  has SpotOptions => (is => 'ro', isa => 'Paws::EC2::SpotMarketOptions');
1;

### main pod documentation begin ###

=head1 NAME

Paws::EC2::InstanceMarketOptionsRequest

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::EC2::InstanceMarketOptionsRequest object:

  $service_obj->Method(Att1 => { MarketType => $value, ..., SpotOptions => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::EC2::InstanceMarketOptionsRequest object:

  $result = $service_obj->Method(...);
  $result->Att1->MarketType

=head1 DESCRIPTION

Describes the market (purchasing) option for the instances.

=head1 ATTRIBUTES


=head2 MarketType => Str

  The market type.


=head2 SpotOptions => L<Paws::EC2::SpotMarketOptions>

  The options for Spot Instances.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::EC2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
