package Paws::MediaConvert::InputDecryptionSettings;
  use Moose;
  has DecryptionMode => (is => 'ro', isa => 'Str', request_name => 'decryptionMode', traits => ['NameInRequest']);
  has EncryptedDecryptionKey => (is => 'ro', isa => 'Str', request_name => 'encryptedDecryptionKey', traits => ['NameInRequest']);
  has InitializationVector => (is => 'ro', isa => 'Str', request_name => 'initializationVector', traits => ['NameInRequest']);
  has KmsKeyRegion => (is => 'ro', isa => 'Str', request_name => 'kmsKeyRegion', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::MediaConvert::InputDecryptionSettings

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::MediaConvert::InputDecryptionSettings object:

  $service_obj->Method(Att1 => { DecryptionMode => $value, ..., KmsKeyRegion => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::MediaConvert::InputDecryptionSettings object:

  $result = $service_obj->Method(...);
  $result->Att1->DecryptionMode

=head1 DESCRIPTION

Settings for decrypting any input files that you encrypt before you
upload them to Amazon S3. MediaConvert can decrypt files only when you
use AWS Key Management Service (KMS) to encrypt the data key that you
use to encrypt your content.

=head1 ATTRIBUTES


=head2 DecryptionMode => Str

  Specify the encryption mode that you used to encrypt your input files.


=head2 EncryptedDecryptionKey => Str

  Warning! Don't provide your encryption key in plaintext. Your job
settings could be intercepted, making your encrypted content
vulnerable. Specify the encrypted version of the data key that you used
to encrypt your content. The data key must be encrypted by AWS Key
Management Service (KMS). The key can be 128, 192, or 256 bits.


=head2 InitializationVector => Str

  Specify the initialization vector that you used when you encrypted your
content before uploading it to Amazon S3. You can use a 16-byte
initialization vector with any encryption mode. Or, you can use a
12-byte initialization vector with GCM or CTR. MediaConvert accepts
only initialization vectors that are base64-encoded.


=head2 KmsKeyRegion => Str

  Specify the AWS Region for AWS Key Management Service (KMS) that you
used to encrypt your data key, if that Region is different from the one
you are using for AWS Elemental MediaConvert.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::MediaConvert>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

