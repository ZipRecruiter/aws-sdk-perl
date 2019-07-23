
package Paws::DynamoDB::DeleteBackup;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has BackupArn => (is => 'ro', isa => Str, required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'DeleteBackup');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::DeleteBackupOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupArn}) {
      $res{BackupArn} = (map {
            "$_"
      } ($args->{BackupArn}))[0];
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

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DeleteBackup - Arguments for method DeleteBackup on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method DeleteBackup on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method DeleteBackup.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to DeleteBackup.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $DeleteBackupOutput = $dynamodb->DeleteBackup(
      BackupArn => 'MyBackupArn',

    );

    # Results:
    my $BackupDescription = $DeleteBackupOutput->BackupDescription;

    # Returns a L<Paws::DynamoDB::DeleteBackupOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/DeleteBackup>

=head1 ATTRIBUTES


=head2 B<REQUIRED> BackupArn => Str

The ARN associated with the backup.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method DeleteBackup in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

