
package Aws::EC2::AllocateAddress {
  use Moose;
  has Domain => (is => 'ro', isa => 'Str');
  has DryRun => (is => 'ro', isa => 'Bool');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'AllocateAddress');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Aws::EC2::AllocateAddressResult');
  class_has _result_key => (isa => 'Str', is => 'ro');
}
1;
