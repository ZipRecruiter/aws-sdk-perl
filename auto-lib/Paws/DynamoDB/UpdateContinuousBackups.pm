
package Paws::DynamoDB::UpdateContinuousBackups;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has PointInTimeRecoverySpecification => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::PointInTimeRecoverySpecification'], required => 1);
  has TableName => (is => 'ro', isa => Str, required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateContinuousBackups');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::UpdateContinuousBackupsOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{PointInTimeRecoverySpecification}) {
      $res{PointInTimeRecoverySpecification} = (map {
            ref($_) eq 'Paws::DynamoDB::PointInTimeRecoverySpecification' ? $_ : do {
              require Paws::DynamoDB::PointInTimeRecoverySpecification;
              Paws::DynamoDB::PointInTimeRecoverySpecification->new_with_coercions($_);
              }
      } ($args->{PointInTimeRecoverySpecification}))[0];
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
      } elsif ($nodeName eq "PointInTimeRecoverySpecification") {
        my $key = "PointInTimeRecoverySpecification";
            $res->{$key} = do {
              require Paws::DynamoDB::PointInTimeRecoverySpecification;
              Paws::DynamoDB::PointInTimeRecoverySpecification->new_from_xml($_);
            };
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
    if (exists $self->{PointInTimeRecoverySpecification}) {
      $res{PointInTimeRecoverySpecification} = (map {
            $_->to_hash_data
      } ($self->PointInTimeRecoverySpecification))[0];
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
    if (exists $self->{PointInTimeRecoverySpecification}) {
      $res{PointInTimeRecoverySpecification} = (map {
            $_->to_json_data
      } ($self->PointInTimeRecoverySpecification))[0];
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


    if (exists $self->{PointInTimeRecoverySpecification}) {
      my $key = "${prefix}PointInTimeRecoverySpecification";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->PointInTimeRecoverySpecification;
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

Paws::DynamoDB::UpdateContinuousBackups - Arguments for method UpdateContinuousBackups on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method UpdateContinuousBackups on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method UpdateContinuousBackups.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to UpdateContinuousBackups.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $UpdateContinuousBackupsOutput = $dynamodb->UpdateContinuousBackups(
      PointInTimeRecoverySpecification => {
        PointInTimeRecoveryEnabled => 1,

      },
      TableName => 'MyTableName',

    );

    # Results:
    my $ContinuousBackupsDescription =
      $UpdateContinuousBackupsOutput->ContinuousBackupsDescription;

    # Returns a L<Paws::DynamoDB::UpdateContinuousBackupsOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/UpdateContinuousBackups>

=head1 ATTRIBUTES


=head2 B<REQUIRED> PointInTimeRecoverySpecification => L<Paws::DynamoDB::PointInTimeRecoverySpecification>

Represents the settings used to enable point in time recovery.



=head2 B<REQUIRED> TableName => Str

The name of the table.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method UpdateContinuousBackups in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

