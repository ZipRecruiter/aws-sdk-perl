
package Paws::S3::CompleteMultipartUploadOutput {
  use Moose;
  with 'Paws::API::ResultParser';
  has Bucket => (is => 'ro', isa => 'Str');
  has ETag => (is => 'ro', isa => 'Str');
  has Expiration => (is => 'ro', isa => 'Str');
  has Key => (is => 'ro', isa => 'Str');
  has Location => (is => 'ro', isa => 'Str');
  has ServerSideEncryption => (is => 'ro', isa => 'Str');
  has SSEKMSKeyId => (is => 'ro', isa => 'Str');
  has VersionId => (is => 'ro', isa => 'Str');

}
1;

### main pod documentation begin ###

=head1 NAME

Paws::S3:: - Arguments for method  on Paws::S3

=head1 DESCRIPTION

This class represents the parameters used for calling the method  on the 
Amazon Simple Storage Service service. Use the attributes of this class
as arguments to method .

You shouln't make instances of this class. Each attribute should be used as a named argument in the call to .

As an example:

  $service_obj->(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES

=head2 Bucket => Str

  

=head2 ETag => Str

  

Entity tag of the object.










=head2 Expiration => Str

  

If the object expiration is configured, this will contain the
expiration date (expiry-date) and rule ID (rule-id). The value of
rule-id is URL encoded.










=head2 Key => Str

  

=head2 Location => Str

  

=head2 ServerSideEncryption => Str

  

The Server-side encryption algorithm used when storing this object in
S3 (e.g., AES256, aws:kms).










=head2 SSEKMSKeyId => Str

  

If present, specifies the ID of the AWS Key Management Service (KMS)
master encryption key that was used for the object.










=head2 VersionId => Str

  

Version of the object.












=head1 SEE ALSO

This class forms part of L<Paws>, and documents parameters for  in Paws::S3

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut
