package Paws::Kafka::EncryptionAtRest;
  use Moose;
  has DataVolumeKMSKeyId => (is => 'ro', isa => 'Str', request_name => 'dataVolumeKMSKeyId', traits => ['NameInRequest'], required => 1);
1;

### main pod documentation begin ###

=head1 NAME

Paws::Kafka::EncryptionAtRest

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Kafka::EncryptionAtRest object:

  $service_obj->Method(Att1 => { DataVolumeKMSKeyId => $value, ..., DataVolumeKMSKeyId => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Kafka::EncryptionAtRest object:

  $result = $service_obj->Method(...);
  $result->Att1->DataVolumeKMSKeyId

=head1 DESCRIPTION

The data volume encryption details.

=head1 ATTRIBUTES


=head2 B<REQUIRED> DataVolumeKMSKeyId => Str

  The AWS KMS key used for data encryption.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Kafka>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut