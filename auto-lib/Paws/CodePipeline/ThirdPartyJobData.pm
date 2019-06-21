package Paws::CodePipeline::ThirdPartyJobData;
  use Moose;
  has ActionConfiguration => (is => 'ro', isa => 'Paws::CodePipeline::ActionConfiguration', request_name => 'actionConfiguration', traits => ['NameInRequest']);
  has ActionTypeId => (is => 'ro', isa => 'Paws::CodePipeline::ActionTypeId', request_name => 'actionTypeId', traits => ['NameInRequest']);
  has ArtifactCredentials => (is => 'ro', isa => 'Paws::CodePipeline::AWSSessionCredentials', request_name => 'artifactCredentials', traits => ['NameInRequest']);
  has ContinuationToken => (is => 'ro', isa => 'Str', request_name => 'continuationToken', traits => ['NameInRequest']);
  has EncryptionKey => (is => 'ro', isa => 'Paws::CodePipeline::EncryptionKey', request_name => 'encryptionKey', traits => ['NameInRequest']);
  has InputArtifacts => (is => 'ro', isa => 'ArrayRef[Paws::CodePipeline::Artifact]', request_name => 'inputArtifacts', traits => ['NameInRequest']);
  has OutputArtifacts => (is => 'ro', isa => 'ArrayRef[Paws::CodePipeline::Artifact]', request_name => 'outputArtifacts', traits => ['NameInRequest']);
  has PipelineContext => (is => 'ro', isa => 'Paws::CodePipeline::PipelineContext', request_name => 'pipelineContext', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::CodePipeline::ThirdPartyJobData

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::CodePipeline::ThirdPartyJobData object:

  $service_obj->Method(Att1 => { ActionConfiguration => $value, ..., PipelineContext => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::CodePipeline::ThirdPartyJobData object:

  $result = $service_obj->Method(...);
  $result->Att1->ActionConfiguration

=head1 DESCRIPTION

Represents information about the job data for a partner action.

=head1 ATTRIBUTES


=head2 ActionConfiguration => L<Paws::CodePipeline::ActionConfiguration>

  Represents information about an action configuration.


=head2 ActionTypeId => L<Paws::CodePipeline::ActionTypeId>

  Represents information about an action type.


=head2 ArtifactCredentials => L<Paws::CodePipeline::AWSSessionCredentials>

  Represents an AWS session credentials object. These credentials are
temporary credentials that are issued by AWS Secure Token Service
(STS). They can be used to access input and output artifacts in the
Amazon S3 bucket used to store artifact for the pipeline in AWS
CodePipeline.


=head2 ContinuationToken => Str

  A system-generated token, such as a AWS CodeDeploy deployment ID, that
a job requires in order to continue the job asynchronously.


=head2 EncryptionKey => L<Paws::CodePipeline::EncryptionKey>

  The encryption key used to encrypt and decrypt data in the artifact
store for the pipeline, such as an AWS Key Management Service (AWS KMS)
key. This is optional and might not be present.


=head2 InputArtifacts => ArrayRef[L<Paws::CodePipeline::Artifact>]

  The name of the artifact that will be worked upon by the action, if
any. This name might be system-generated, such as "MyApp", or might be
defined by the user when the action is created. The input artifact name
must match the name of an output artifact generated by an action in an
earlier action or stage of the pipeline.


=head2 OutputArtifacts => ArrayRef[L<Paws::CodePipeline::Artifact>]

  The name of the artifact that will be the result of the action, if any.
This name might be system-generated, such as "MyBuiltApp", or might be
defined by the user when the action is created.


=head2 PipelineContext => L<Paws::CodePipeline::PipelineContext>

  Represents information about a pipeline to a job worker.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::CodePipeline>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
