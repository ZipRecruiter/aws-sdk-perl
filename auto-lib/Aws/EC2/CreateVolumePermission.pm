package Aws::EC2::CreateVolumePermission {
  use Moose;
  with ('AWS::API::UnwrappedParser');
  has Group => (is => 'ro', isa => 'Str', traits => ['Unwrapped'], xmlname => 'group');
  has UserId => (is => 'ro', isa => 'Str', traits => ['Unwrapped'], xmlname => 'userId');
}
1
