
package Paws::DynamoDB::CreateBackup;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has BackupName => (is => 'ro', isa => Str, required => 1);
  has TableName => (is => 'ro', isa => Str, required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'CreateBackup');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::CreateBackupOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupName}) {
      $res{BackupName} = (map {
            "$_"
      } ($args->{BackupName}))[0];
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
      } elsif ($nodeName eq "BackupName") {
        my $key = "BackupName";
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
    if (exists $self->{BackupName}) {
      $res{BackupName} = (map {
            "$_"
      } ($self->BackupName))[0];
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
    if (exists $self->{BackupName}) {
      $res{BackupName} = (map {
            "$_"
      } ($self->BackupName))[0];
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


    if (exists $self->{BackupName}) {
      my $key = "${prefix}BackupName";
      do {
            $res->{$key} = "$_";
      } for $self->BackupName;
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

Paws::DynamoDB::CreateBackup - Arguments for method CreateBackup on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method CreateBackup on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method CreateBackup.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to CreateBackup.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $CreateBackupOutput = $dynamodb->CreateBackup(
      BackupName => 'MyBackupName',
      TableName  => 'MyTableName',

    );

    # Results:
    my $BackupDetails = $CreateBackupOutput->BackupDetails;

    # Returns a L<Paws::DynamoDB::CreateBackupOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/CreateBackup>

=head1 ATTRIBUTES


=head2 B<REQUIRED> BackupName => Str

Specified name for the backup.



=head2 B<REQUIRED> TableName => Str

The name of the table.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method CreateBackup in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

