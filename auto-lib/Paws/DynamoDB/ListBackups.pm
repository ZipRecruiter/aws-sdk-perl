
package Paws::DynamoDB::ListBackups;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has BackupType => (is => 'ro', isa => Str);
  has ExclusiveStartBackupArn => (is => 'ro', isa => Str);
  has Limit => (is => 'ro', isa => Int);
  has TableName => (is => 'ro', isa => Str);
  has TimeRangeLowerBound => (is => 'ro', isa => Str);
  has TimeRangeUpperBound => (is => 'ro', isa => Str);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListBackups');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::ListBackupsOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupType}) {
      $res{BackupType} = (map {
            "$_"
      } ($args->{BackupType}))[0];
    }
    if (exists $args->{ExclusiveStartBackupArn}) {
      $res{ExclusiveStartBackupArn} = (map {
            "$_"
      } ($args->{ExclusiveStartBackupArn}))[0];
    }
    if (exists $args->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($args->{Limit}))[0];
    }
    if (exists $args->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($args->{TableName}))[0];
    }
    if (exists $args->{TimeRangeLowerBound}) {
      $res{TimeRangeLowerBound} = (map {
            "$_"
      } ($args->{TimeRangeLowerBound}))[0];
    }
    if (exists $args->{TimeRangeUpperBound}) {
      $res{TimeRangeUpperBound} = (map {
            "$_"
      } ($args->{TimeRangeUpperBound}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "BackupType") {
        my $key = "BackupType";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ExclusiveStartBackupArn") {
        my $key = "ExclusiveStartBackupArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "Limit") {
        my $key = "Limit";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "TableName") {
        my $key = "TableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TimeRangeLowerBound") {
        my $key = "TimeRangeLowerBound";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TimeRangeUpperBound") {
        my $key = "TimeRangeUpperBound";
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
    if (exists $self->{BackupType}) {
      $res{BackupType} = (map {
            "$_"
      } ($self->BackupType))[0];
    }
    if (exists $self->{ExclusiveStartBackupArn}) {
      $res{ExclusiveStartBackupArn} = (map {
            "$_"
      } ($self->ExclusiveStartBackupArn))[0];
    }
    if (exists $self->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($self->Limit))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{TimeRangeLowerBound}) {
      $res{TimeRangeLowerBound} = (map {
            "$_"
      } ($self->TimeRangeLowerBound))[0];
    }
    if (exists $self->{TimeRangeUpperBound}) {
      $res{TimeRangeUpperBound} = (map {
            "$_"
      } ($self->TimeRangeUpperBound))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BackupType}) {
      $res{BackupType} = (map {
            "$_"
      } ($self->BackupType))[0];
    }
    if (exists $self->{ExclusiveStartBackupArn}) {
      $res{ExclusiveStartBackupArn} = (map {
            "$_"
      } ($self->ExclusiveStartBackupArn))[0];
    }
    if (exists $self->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($self->Limit))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{TimeRangeLowerBound}) {
      $res{TimeRangeLowerBound} = (map {
            "$_"
      } ($self->TimeRangeLowerBound))[0];
    }
    if (exists $self->{TimeRangeUpperBound}) {
      $res{TimeRangeUpperBound} = (map {
            "$_"
      } ($self->TimeRangeUpperBound))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{BackupType}) {
      my $key = "${prefix}BackupType";
      do {
            $res->{$key} = "$_";
      } for $self->BackupType;
    }

    if (exists $self->{ExclusiveStartBackupArn}) {
      my $key = "${prefix}ExclusiveStartBackupArn";
      do {
            $res->{$key} = "$_";
      } for $self->ExclusiveStartBackupArn;
    }

    if (exists $self->{Limit}) {
      my $key = "${prefix}Limit";
      do {
            $res->{$key} = int($_);
      } for $self->Limit;
    }

    if (exists $self->{TableName}) {
      my $key = "${prefix}TableName";
      do {
            $res->{$key} = "$_";
      } for $self->TableName;
    }

    if (exists $self->{TimeRangeLowerBound}) {
      my $key = "${prefix}TimeRangeLowerBound";
      do {
            $res->{$key} = "$_";
      } for $self->TimeRangeLowerBound;
    }

    if (exists $self->{TimeRangeUpperBound}) {
      my $key = "${prefix}TimeRangeUpperBound";
      do {
            $res->{$key} = "$_";
      } for $self->TimeRangeUpperBound;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListBackups - Arguments for method ListBackups on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListBackups on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method ListBackups.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ListBackups.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $ListBackupsOutput = $dynamodb->ListBackups(
      BackupType              => 'USER',                   # OPTIONAL
      ExclusiveStartBackupArn => 'MyBackupArn',            # OPTIONAL
      Limit                   => 1,                        # OPTIONAL
      TableName               => 'MyTableName',            # OPTIONAL
      TimeRangeLowerBound     => '1970-01-01T01:00:00',    # OPTIONAL
      TimeRangeUpperBound     => '1970-01-01T01:00:00',    # OPTIONAL
    );

    # Results:
    my $BackupSummaries        = $ListBackupsOutput->BackupSummaries;
    my $LastEvaluatedBackupArn = $ListBackupsOutput->LastEvaluatedBackupArn;

    # Returns a L<Paws::DynamoDB::ListBackupsOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/ListBackups>

=head1 ATTRIBUTES


=head2 BackupType => Str

The backups from the table specified by C<BackupType> are listed.

Where C<BackupType> can be:

=over

=item *

C<USER> - On-demand backup created by you.

=item *

C<SYSTEM> - On-demand backup automatically created by DynamoDB.

=item *

C<ALL> - All types of on-demand backups (USER and SYSTEM).

=back


Valid values are: C<"USER">, C<"SYSTEM">, C<"AWS_BACKUP">, C<"ALL">

=head2 ExclusiveStartBackupArn => Str

C<LastEvaluatedBackupArn> is the ARN of the backup last evaluated when
the current page of results was returned, inclusive of the current page
of results. This value may be specified as the
C<ExclusiveStartBackupArn> of a new C<ListBackups> operation in order
to fetch the next page of results.



=head2 Limit => Int

Maximum number of backups to return at once.



=head2 TableName => Str

The backups from the table specified by C<TableName> are listed.



=head2 TimeRangeLowerBound => Str

Only backups created after this time are listed. C<TimeRangeLowerBound>
is inclusive.



=head2 TimeRangeUpperBound => Str

Only backups created before this time are listed.
C<TimeRangeUpperBound> is exclusive.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ListBackups in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

