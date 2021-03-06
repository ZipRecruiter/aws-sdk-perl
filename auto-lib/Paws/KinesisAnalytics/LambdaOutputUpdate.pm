package Paws::KinesisAnalytics::LambdaOutputUpdate;
  use Moose;
  has ResourceARNUpdate => (is => 'ro', isa => 'Str');
  has RoleARNUpdate => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::KinesisAnalytics::LambdaOutputUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::KinesisAnalytics::LambdaOutputUpdate object:

  $service_obj->Method(Att1 => { ResourceARNUpdate => $value, ..., RoleARNUpdate => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::KinesisAnalytics::LambdaOutputUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->ResourceARNUpdate

=head1 DESCRIPTION

When updating an output configuration using the UpdateApplication
(https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html)
operation, provides information about an AWS Lambda function configured
as the destination.

=head1 ATTRIBUTES


=head2 ResourceARNUpdate => Str

  Amazon Resource Name (ARN) of the destination Lambda function.

To specify an earlier version of the Lambda function than the latest,
include the Lambda function version in the Lambda function ARN. For
more information about Lambda ARNs, see Example ARNs: AWS Lambda


=head2 RoleARNUpdate => Str

  ARN of the IAM role that Amazon Kinesis Analytics can assume to write
to the destination function on your behalf. You need to grant the
necessary permissions to this role.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::KinesisAnalytics>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

