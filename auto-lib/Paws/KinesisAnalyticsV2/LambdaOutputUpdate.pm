package Paws::KinesisAnalyticsV2::LambdaOutputUpdate;
  use Moose;
  has ResourceARNUpdate => (is => 'ro', isa => 'Str', required => 1);
1;

### main pod documentation begin ###

=head1 NAME

Paws::KinesisAnalyticsV2::LambdaOutputUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::KinesisAnalyticsV2::LambdaOutputUpdate object:

  $service_obj->Method(Att1 => { ResourceARNUpdate => $value, ..., ResourceARNUpdate => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::KinesisAnalyticsV2::LambdaOutputUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->ResourceARNUpdate

=head1 DESCRIPTION

When you update an SQL-based Amazon Kinesis Data Analytics
application's output configuration using the UpdateApplication
operation, provides information about an AWS Lambda function that is
configured as the destination.

=head1 ATTRIBUTES


=head2 B<REQUIRED> ResourceARNUpdate => Str

  The Amazon Resource Name (ARN) of the destination AWS Lambda function.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::KinesisAnalyticsV2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut