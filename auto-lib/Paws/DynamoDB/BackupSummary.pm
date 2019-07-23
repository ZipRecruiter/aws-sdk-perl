package Paws::DynamoDB::BackupSummary;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has BackupArn => (is => 'ro', isa => Str);
  has BackupCreationDateTime => (is => 'ro', isa => Str);
  has BackupExpiryDateTime => (is => 'ro', isa => Str);
  has BackupName => (is => 'ro', isa => Str);
  has BackupSizeBytes => (is => 'ro', isa => Int);
  has BackupStatus => (is => 'ro', isa => Str);
  has BackupType => (is => 'ro', isa => Str);
  has TableArn => (is => 'ro', isa => Str);
  has TableId => (is => 'ro', isa => Str);
  has TableName => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupArn}) {
      $res{BackupArn} = (map {
            "$_"
      } ($args->{BackupArn}))[0];
    }
    if (exists $args->{BackupCreationDateTime}) {
      $res{BackupCreationDateTime} = (map {
            "$_"
      } ($args->{BackupCreationDateTime}))[0];
    }
    if (exists $args->{BackupExpiryDateTime}) {
      $res{BackupExpiryDateTime} = (map {
            "$_"
      } ($args->{BackupExpiryDateTime}))[0];
    }
    if (exists $args->{BackupName}) {
      $res{BackupName} = (map {
            "$_"
      } ($args->{BackupName}))[0];
    }
    if (exists $args->{BackupSizeBytes}) {
      $res{BackupSizeBytes} = (map {
            int($_)
      } ($args->{BackupSizeBytes}))[0];
    }
    if (exists $args->{BackupStatus}) {
      $res{BackupStatus} = (map {
            "$_"
      } ($args->{BackupStatus}))[0];
    }
    if (exists $args->{BackupType}) {
      $res{BackupType} = (map {
            "$_"
      } ($args->{BackupType}))[0];
    }
    if (exists $args->{TableArn}) {
      $res{TableArn} = (map {
            "$_"
      } ($args->{TableArn}))[0];
    }
    if (exists $args->{TableId}) {
      $res{TableId} = (map {
            "$_"
      } ($args->{TableId}))[0];
    }
    if (exists $args->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($args->{TableName}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "BackupArn") {
        my $key = "BackupArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "BackupCreationDateTime") {
        my $key = "BackupCreationDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "BackupExpiryDateTime") {
        my $key = "BackupExpiryDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "BackupName") {
        my $key = "BackupName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "BackupSizeBytes") {
        my $key = "BackupSizeBytes";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "BackupStatus") {
        my $key = "BackupStatus";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "BackupType") {
        my $key = "BackupType";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableArn") {
        my $key = "TableArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableId") {
        my $key = "TableId";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableName") {
        my $key = "TableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BackupArn}) {
      $res{BackupArn} = (map {
            "$_"
      } ($self->BackupArn))[0];
    }
    if (exists $self->{BackupCreationDateTime}) {
      $res{BackupCreationDateTime} = (map {
            "$_"
      } ($self->BackupCreationDateTime))[0];
    }
    if (exists $self->{BackupExpiryDateTime}) {
      $res{BackupExpiryDateTime} = (map {
            "$_"
      } ($self->BackupExpiryDateTime))[0];
    }
    if (exists $self->{BackupName}) {
      $res{BackupName} = (map {
            "$_"
      } ($self->BackupName))[0];
    }
    if (exists $self->{BackupSizeBytes}) {
      $res{BackupSizeBytes} = (map {
            int($_)
      } ($self->BackupSizeBytes))[0];
    }
    if (exists $self->{BackupStatus}) {
      $res{BackupStatus} = (map {
            "$_"
      } ($self->BackupStatus))[0];
    }
    if (exists $self->{BackupType}) {
      $res{BackupType} = (map {
            "$_"
      } ($self->BackupType))[0];
    }
    if (exists $self->{TableArn}) {
      $res{TableArn} = (map {
            "$_"
      } ($self->TableArn))[0];
    }
    if (exists $self->{TableId}) {
      $res{TableId} = (map {
            "$_"
      } ($self->TableId))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BackupArn}) {
      $res{BackupArn} = (map {
            "$_"
      } ($self->BackupArn))[0];
    }
    if (exists $self->{BackupCreationDateTime}) {
      $res{BackupCreationDateTime} = (map {
            "$_"
      } ($self->BackupCreationDateTime))[0];
    }
    if (exists $self->{BackupExpiryDateTime}) {
      $res{BackupExpiryDateTime} = (map {
            "$_"
      } ($self->BackupExpiryDateTime))[0];
    }
    if (exists $self->{BackupName}) {
      $res{BackupName} = (map {
            "$_"
      } ($self->BackupName))[0];
    }
    if (exists $self->{BackupSizeBytes}) {
      $res{BackupSizeBytes} = (map {
            int($_)
      } ($self->BackupSizeBytes))[0];
    }
    if (exists $self->{BackupStatus}) {
      $res{BackupStatus} = (map {
            "$_"
      } ($self->BackupStatus))[0];
    }
    if (exists $self->{BackupType}) {
      $res{BackupType} = (map {
            "$_"
      } ($self->BackupType))[0];
    }
    if (exists $self->{TableArn}) {
      $res{TableArn} = (map {
            "$_"
      } ($self->TableArn))[0];
    }
    if (exists $self->{TableId}) {
      $res{TableId} = (map {
            "$_"
      } ($self->TableId))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{BackupArn}) {
      my $key = "${prefix}BackupArn";
      do {
            $res->{$key} = "$_";
      } for $self->BackupArn;
    }

    if (exists $self->{BackupCreationDateTime}) {
      my $key = "${prefix}BackupCreationDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->BackupCreationDateTime;
    }

    if (exists $self->{BackupExpiryDateTime}) {
      my $key = "${prefix}BackupExpiryDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->BackupExpiryDateTime;
    }

    if (exists $self->{BackupName}) {
      my $key = "${prefix}BackupName";
      do {
            $res->{$key} = "$_";
      } for $self->BackupName;
    }

    if (exists $self->{BackupSizeBytes}) {
      my $key = "${prefix}BackupSizeBytes";
      do {
            $res->{$key} = int($_);
      } for $self->BackupSizeBytes;
    }

    if (exists $self->{BackupStatus}) {
      my $key = "${prefix}BackupStatus";
      do {
            $res->{$key} = "$_";
      } for $self->BackupStatus;
    }

    if (exists $self->{BackupType}) {
      my $key = "${prefix}BackupType";
      do {
            $res->{$key} = "$_";
      } for $self->BackupType;
    }

    if (exists $self->{TableArn}) {
      my $key = "${prefix}TableArn";
      do {
            $res->{$key} = "$_";
      } for $self->TableArn;
    }

    if (exists $self->{TableId}) {
      my $key = "${prefix}TableId";
      do {
            $res->{$key} = "$_";
      } for $self->TableId;
    }

    if (exists $self->{TableName}) {
      my $key = "${prefix}TableName";
      do {
            $res->{$key} = "$_";
      } for $self->TableName;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::BackupSummary

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::BackupSummary object:

  $service_obj->Method(Att1 => { BackupArn => $value, ..., TableName => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::BackupSummary object:

  $result = $service_obj->Method(...);
  $result->Att1->BackupArn

=head1 DESCRIPTION

Contains details for the backup.

=head1 ATTRIBUTES


=head2 BackupArn => Str

  ARN associated with the backup.


=head2 BackupCreationDateTime => Str

  Time at which the backup was created.


=head2 BackupExpiryDateTime => Str

  Time at which the automatic on-demand backup created by DynamoDB will
expire. This C<SYSTEM> on-demand backup expires automatically 35 days
after its creation.


=head2 BackupName => Str

  Name of the specified backup.


=head2 BackupSizeBytes => Int

  Size of the backup in bytes.


=head2 BackupStatus => Str

  Backup can be in one of the following states: CREATING, ACTIVE,
DELETED.


=head2 BackupType => Str

  BackupType:

=over

=item *

C<USER> - You create and manage these using the on-demand backup
feature.

=item *

C<SYSTEM> - If you delete a table with point-in-time recovery enabled,
a C<SYSTEM> backup is automatically created and is retained for 35 days
(at no additional cost). System backups allow you to restore the
deleted table to the state it was in just before the point of deletion.

=item *

C<AWS_BACKUP> - On-demand backup created by you from AWS Backup
service.

=back



=head2 TableArn => Str

  ARN associated with the table.


=head2 TableId => Str

  Unique identifier for the table.


=head2 TableName => Str

  Name of the table.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
