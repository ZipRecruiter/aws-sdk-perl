package Paws::KinesisAnalyticsV2::KinesisStreamsOutput;
  use Moose;
  has ResourceARN => (is => 'ro', isa => 'Str', required => 1);
1;

### main pod documentation begin ###

=head1 NAME

Paws::KinesisAnalyticsV2::KinesisStreamsOutput

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::KinesisAnalyticsV2::KinesisStreamsOutput object:

  $service_obj->Method(Att1 => { ResourceARN => $value, ..., ResourceARN => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::KinesisAnalyticsV2::KinesisStreamsOutput object:

  $result = $service_obj->Method(...);
  $result->Att1->ResourceARN

=head1 DESCRIPTION

When you configure an SQL-based Amazon Kinesis Data Analytics
application's output, identifies a Kinesis data stream as the
destination. You provide the stream Amazon Resource Name (ARN).

=head1 ATTRIBUTES


=head2 B<REQUIRED> ResourceARN => Str

  The ARN of the destination Kinesis data stream to write to.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::KinesisAnalyticsV2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut