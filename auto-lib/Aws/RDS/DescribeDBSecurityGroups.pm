
package Aws::RDS::DescribeDBSecurityGroups {
  use Moose;
  has DBSecurityGroupName => (is => 'ro', isa => 'Str');
  has Marker => (is => 'ro', isa => 'Str');
  has MaxRecords => (is => 'ro', isa => 'Int');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeDBSecurityGroups');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Aws::RDS::DescribeDBSecurityGroupsResult');
  class_has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeDBSecurityGroupsResult');
}
1;
  