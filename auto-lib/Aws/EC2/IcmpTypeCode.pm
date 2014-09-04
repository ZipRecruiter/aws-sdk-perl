package Aws::EC2::IcmpTypeCode {
  use Moose;
  with ('AWS::API::UnwrappedParser');
  has Code => (is => 'ro', isa => 'Int', traits => ['Unwrapped'], xmlname => 'code');
  has Type => (is => 'ro', isa => 'Int', traits => ['Unwrapped'], xmlname => 'type');
}
1