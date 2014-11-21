
package Aws::AutoScaling::DescribeAccountLimitsAnswer {
  use Moose;
  with 'AWS::API::ResultParser';
  has MaxNumberOfAutoScalingGroups => (is => 'ro', isa => 'Int');
  has MaxNumberOfLaunchConfigurations => (is => 'ro', isa => 'Int');

}
1;