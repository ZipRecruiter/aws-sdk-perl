
package Paws::DynamoDB::RestoreTableToPointInTime;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has RestoreDateTime => (is => 'ro', isa => Str);
  has SourceTableName => (is => 'ro', isa => Str, required => 1);
  has TargetTableName => (is => 'ro', isa => Str, required => 1);
  has UseLatestRestorableTime => (is => 'ro', isa => Bool);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'RestoreTableToPointInTime');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::RestoreTableToPointInTimeOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{RestoreDateTime}) {
      $res{RestoreDateTime} = (map {
            "$_"
      } ($args->{RestoreDateTime}))[0];
    }
    if (exists $args->{SourceTableName}) {
      $res{SourceTableName} = (map {
            "$_"
      } ($args->{SourceTableName}))[0];
    }
    if (exists $args->{TargetTableName}) {
      $res{TargetTableName} = (map {
            "$_"
      } ($args->{TargetTableName}))[0];
    }
    if (exists $args->{UseLatestRestorableTime}) {
      $res{UseLatestRestorableTime} = (map {
            0 + !!$_
      } ($args->{UseLatestRestorableTime}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "RestoreDateTime") {
        my $key = "RestoreDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "SourceTableName") {
        my $key = "SourceTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TargetTableName") {
        my $key = "TargetTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "UseLatestRestorableTime") {
        my $key = "UseLatestRestorableTime";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{RestoreDateTime}) {
      $res{RestoreDateTime} = (map {
            "$_"
      } ($self->RestoreDateTime))[0];
    }
    if (exists $self->{SourceTableName}) {
      $res{SourceTableName} = (map {
            "$_"
      } ($self->SourceTableName))[0];
    }
    if (exists $self->{TargetTableName}) {
      $res{TargetTableName} = (map {
            "$_"
      } ($self->TargetTableName))[0];
    }
    if (exists $self->{UseLatestRestorableTime}) {
      $res{UseLatestRestorableTime} = (map {
            0 + !!$_
      } ($self->UseLatestRestorableTime))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{RestoreDateTime}) {
      $res{RestoreDateTime} = (map {
            "$_"
      } ($self->RestoreDateTime))[0];
    }
    if (exists $self->{SourceTableName}) {
      $res{SourceTableName} = (map {
            "$_"
      } ($self->SourceTableName))[0];
    }
    if (exists $self->{TargetTableName}) {
      $res{TargetTableName} = (map {
            "$_"
      } ($self->TargetTableName))[0];
    }
    if (exists $self->{UseLatestRestorableTime}) {
      $res{UseLatestRestorableTime} = (map {
            $_ ? \1 : \0
      } ($self->UseLatestRestorableTime))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{RestoreDateTime}) {
      my $key = "${prefix}RestoreDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->RestoreDateTime;
    }

    if (exists $self->{SourceTableName}) {
      my $key = "${prefix}SourceTableName";
      do {
            $res->{$key} = "$_";
      } for $self->SourceTableName;
    }

    if (exists $self->{TargetTableName}) {
      my $key = "${prefix}TargetTableName";
      do {
            $res->{$key} = "$_";
      } for $self->TargetTableName;
    }

    if (exists $self->{UseLatestRestorableTime}) {
      my $key = "${prefix}UseLatestRestorableTime";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->UseLatestRestorableTime;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::RestoreTableToPointInTime - Arguments for method RestoreTableToPointInTime on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method RestoreTableToPointInTime on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method RestoreTableToPointInTime.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to RestoreTableToPointInTime.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $RestoreTableToPointInTimeOutput = $dynamodb->RestoreTableToPointInTime(
      SourceTableName         => 'MyTableName',
      TargetTableName         => 'MyTableName',
      RestoreDateTime         => '1970-01-01T01:00:00',    # OPTIONAL
      UseLatestRestorableTime => 1,                        # OPTIONAL
    );

    # Results:
    my $TableDescription = $RestoreTableToPointInTimeOutput->TableDescription;

    # Returns a L<Paws::DynamoDB::RestoreTableToPointInTimeOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/RestoreTableToPointInTime>

=head1 ATTRIBUTES


=head2 RestoreDateTime => Str

Time in the past to restore the table to.



=head2 B<REQUIRED> SourceTableName => Str

Name of the source table that is being restored.



=head2 B<REQUIRED> TargetTableName => Str

The name of the new table to which it must be restored to.



=head2 UseLatestRestorableTime => Bool

Restore the table to the latest possible time.
C<LatestRestorableDateTime> is typically 5 minutes before the current
time.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method RestoreTableToPointInTime in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

