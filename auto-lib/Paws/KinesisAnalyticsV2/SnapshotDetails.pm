package Paws::KinesisAnalyticsV2::SnapshotDetails;
  use Moose;
  has ApplicationVersionId => (is => 'ro', isa => 'Int', required => 1);
  has SnapshotCreationTimestamp => (is => 'ro', isa => 'Str');
  has SnapshotName => (is => 'ro', isa => 'Str', required => 1);
  has SnapshotStatus => (is => 'ro', isa => 'Str', required => 1);
1;

### main pod documentation begin ###

=head1 NAME

Paws::KinesisAnalyticsV2::SnapshotDetails

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::KinesisAnalyticsV2::SnapshotDetails object:

  $service_obj->Method(Att1 => { ApplicationVersionId => $value, ..., SnapshotStatus => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::KinesisAnalyticsV2::SnapshotDetails object:

  $result = $service_obj->Method(...);
  $result->Att1->ApplicationVersionId

=head1 DESCRIPTION

Provides details about a snapshot of application state.

=head1 ATTRIBUTES


=head2 B<REQUIRED> ApplicationVersionId => Int

  The current application version ID when the snapshot was created.


=head2 SnapshotCreationTimestamp => Str

  The timestamp of the application snapshot.


=head2 B<REQUIRED> SnapshotName => Str

  The identifier for the application snapshot.


=head2 B<REQUIRED> SnapshotStatus => Str

  The status of the application snapshot.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::KinesisAnalyticsV2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut