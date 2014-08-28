
package Aws::EC2::AttachVpnGateway {
  use Moose;
  has DryRun => (is => 'ro', isa => 'Bool');
  has VpcId => (is => 'ro', isa => 'Str', required => 1);
  has VpnGatewayId => (is => 'ro', isa => 'Str', required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'AttachVpnGateway');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Aws::EC2::AttachVpnGatewayResult');
  class_has _result_key => (isa => 'Str', is => 'ro');
}
1;
