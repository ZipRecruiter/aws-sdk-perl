
package Paws::DynamoDB::UpdateGlobalTableSettings;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has GlobalTableBillingMode => (is => 'ro', isa => Str);
  has GlobalTableGlobalSecondaryIndexSettingsUpdate => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate']]);
  has GlobalTableName => (is => 'ro', isa => Str, required => 1);
  has GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingSettingsUpdate']);
  has GlobalTableProvisionedWriteCapacityUnits => (is => 'ro', isa => Int);
  has ReplicaSettingsUpdate => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ReplicaSettingsUpdate']]);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateGlobalTableSettings');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::UpdateGlobalTableSettingsOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{GlobalTableBillingMode}) {
      $res{GlobalTableBillingMode} = (map {
            "$_"
      } ($args->{GlobalTableBillingMode}))[0];
    }
    if (exists $args->{GlobalTableGlobalSecondaryIndexSettingsUpdate}) {
      $res{GlobalTableGlobalSecondaryIndexSettingsUpdate} = (map {
            [
              map {
                ref($_) eq
                  'Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate'
                  ? $_
                  : do {
                  require Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate;
                  Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate
                    ->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{GlobalTableGlobalSecondaryIndexSettingsUpdate}))[0];
    }
    if (exists $args->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($args->{GlobalTableName}))[0];
    }
    if (exists $args->{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      $res{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate} = (map {
            ref($_) eq 'Paws::DynamoDB::AutoScalingSettingsUpdate' ? $_ : do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_with_coercions($_);
              }
      } ($args->{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate}))[0];
    }
    if (exists $args->{GlobalTableProvisionedWriteCapacityUnits}) {
      $res{GlobalTableProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($args->{GlobalTableProvisionedWriteCapacityUnits}))[0];
    }
    if (exists $args->{ReplicaSettingsUpdate}) {
      $res{ReplicaSettingsUpdate} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::ReplicaSettingsUpdate' ? $_ : do {
                  require Paws::DynamoDB::ReplicaSettingsUpdate;
                  Paws::DynamoDB::ReplicaSettingsUpdate->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{ReplicaSettingsUpdate}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "GlobalTableBillingMode") {
        my $key = "GlobalTableBillingMode";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "GlobalTableGlobalSecondaryIndexSettingsUpdate") {
        my $key = "GlobalTableGlobalSecondaryIndexSettingsUpdate";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate;
                Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate
                  ->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "GlobalTableName") {
        my $key = "GlobalTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate") {
        my $key = "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate";
            $res->{$key} = do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_from_xml($_);
            };
      } elsif ($nodeName eq "GlobalTableProvisionedWriteCapacityUnits") {
        my $key = "GlobalTableProvisionedWriteCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "ReplicaSettingsUpdate") {
        my $key = "ReplicaSettingsUpdate";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ReplicaSettingsUpdate;
                Paws::DynamoDB::ReplicaSettingsUpdate->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{GlobalTableBillingMode}) {
      $res{GlobalTableBillingMode} = (map {
            "$_"
      } ($self->GlobalTableBillingMode))[0];
    }
    if (exists $self->{GlobalTableGlobalSecondaryIndexSettingsUpdate}) {
      $res{GlobalTableGlobalSecondaryIndexSettingsUpdate} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->GlobalTableGlobalSecondaryIndexSettingsUpdate))[0];
    }
    if (exists $self->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($self->GlobalTableName))[0];
    }
    if (exists $self->{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      $res{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_hash_data
      } ($self->GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{GlobalTableProvisionedWriteCapacityUnits}) {
      $res{GlobalTableProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($self->GlobalTableProvisionedWriteCapacityUnits))[0];
    }
    if (exists $self->{ReplicaSettingsUpdate}) {
      $res{ReplicaSettingsUpdate} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ReplicaSettingsUpdate))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{GlobalTableBillingMode}) {
      $res{GlobalTableBillingMode} = (map {
            "$_"
      } ($self->GlobalTableBillingMode))[0];
    }
    if (exists $self->{GlobalTableGlobalSecondaryIndexSettingsUpdate}) {
      $res{GlobalTableGlobalSecondaryIndexSettingsUpdate} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->GlobalTableGlobalSecondaryIndexSettingsUpdate))[0];
    }
    if (exists $self->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($self->GlobalTableName))[0];
    }
    if (exists $self->{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      $res{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_json_data
      } ($self->GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{GlobalTableProvisionedWriteCapacityUnits}) {
      $res{GlobalTableProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($self->GlobalTableProvisionedWriteCapacityUnits))[0];
    }
    if (exists $self->{ReplicaSettingsUpdate}) {
      $res{ReplicaSettingsUpdate} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->ReplicaSettingsUpdate))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{GlobalTableBillingMode}) {
      my $key = "${prefix}GlobalTableBillingMode";
      do {
            $res->{$key} = "$_";
      } for $self->GlobalTableBillingMode;
    }

    if (exists $self->{GlobalTableGlobalSecondaryIndexSettingsUpdate}) {
      my $key = "${prefix}GlobalTableGlobalSecondaryIndexSettingsUpdate";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $_->to_parameter_data( $res, $key );
                }
                for $val;
            }
      } for $self->GlobalTableGlobalSecondaryIndexSettingsUpdate;
    }

    if (exists $self->{GlobalTableName}) {
      my $key = "${prefix}GlobalTableName";
      do {
            $res->{$key} = "$_";
      } for $self->GlobalTableName;
    }

    if (exists $self->{GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      my $key = "${prefix}GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate;
    }

    if (exists $self->{GlobalTableProvisionedWriteCapacityUnits}) {
      my $key = "${prefix}GlobalTableProvisionedWriteCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->GlobalTableProvisionedWriteCapacityUnits;
    }

    if (exists $self->{ReplicaSettingsUpdate}) {
      my $key = "${prefix}ReplicaSettingsUpdate";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $_->to_parameter_data( $res, $key );
                }
                for $val;
            }
      } for $self->ReplicaSettingsUpdate;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::UpdateGlobalTableSettings - Arguments for method UpdateGlobalTableSettings on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method UpdateGlobalTableSettings on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method UpdateGlobalTableSettings.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to UpdateGlobalTableSettings.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $UpdateGlobalTableSettingsOutput = $dynamodb->UpdateGlobalTableSettings(
      GlobalTableName                               => 'MyTableName',
      GlobalTableBillingMode                        => 'PROVISIONED', # OPTIONAL
      GlobalTableGlobalSecondaryIndexSettingsUpdate => [
        {
          IndexName => 'MyIndexName',    # min: 3, max: 255
          ProvisionedWriteCapacityAutoScalingSettingsUpdate => {
            AutoScalingDisabled => 1,    # OPTIONAL
            AutoScalingRoleArn =>
              'MyAutoScalingRoleArn',    # min: 1, max: 1600; OPTIONAL
            MaximumUnits        => 1,    # min: 1; OPTIONAL
            MinimumUnits        => 1,    # min: 1; OPTIONAL
            ScalingPolicyUpdate => {
              TargetTrackingScalingPolicyConfiguration => {
                TargetValue      => 1,
                DisableScaleIn   => 1,    # OPTIONAL
                ScaleInCooldown  => 1,    # OPTIONAL
                ScaleOutCooldown => 1,    # OPTIONAL
              },
              PolicyName =>
                'MyAutoScalingPolicyName',    # min: 1, max: 256; OPTIONAL
            },    # OPTIONAL
          },    # OPTIONAL
          ProvisionedWriteCapacityUnits => 1,    # min: 1; OPTIONAL
        },
        ...
      ],                                         # OPTIONAL
      GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate => {
        AutoScalingDisabled => 1,                # OPTIONAL
        AutoScalingRoleArn =>
          'MyAutoScalingRoleArn',                # min: 1, max: 1600; OPTIONAL
        MaximumUnits        => 1,                # min: 1; OPTIONAL
        MinimumUnits        => 1,                # min: 1; OPTIONAL
        ScalingPolicyUpdate => {
          TargetTrackingScalingPolicyConfiguration => {
            TargetValue      => 1,
            DisableScaleIn   => 1,               # OPTIONAL
            ScaleInCooldown  => 1,               # OPTIONAL
            ScaleOutCooldown => 1,               # OPTIONAL
          },
          PolicyName => 'MyAutoScalingPolicyName',  # min: 1, max: 256; OPTIONAL
        },    # OPTIONAL
      },    # OPTIONAL
      GlobalTableProvisionedWriteCapacityUnits => 1,    # OPTIONAL
      ReplicaSettingsUpdate                    => [
        {
          RegionName                                => 'MyRegionName',
          ReplicaGlobalSecondaryIndexSettingsUpdate => [
            {
              IndexName => 'MyIndexName',               # min: 3, max: 255
              ProvisionedReadCapacityAutoScalingSettingsUpdate => {
                AutoScalingDisabled => 1,               # OPTIONAL
                AutoScalingRoleArn =>
                  'MyAutoScalingRoleArn',    # min: 1, max: 1600; OPTIONAL
                MaximumUnits        => 1,    # min: 1; OPTIONAL
                MinimumUnits        => 1,    # min: 1; OPTIONAL
                ScalingPolicyUpdate => {
                  TargetTrackingScalingPolicyConfiguration => {
                    TargetValue      => 1,
                    DisableScaleIn   => 1,    # OPTIONAL
                    ScaleInCooldown  => 1,    # OPTIONAL
                    ScaleOutCooldown => 1,    # OPTIONAL
                  },
                  PolicyName =>
                    'MyAutoScalingPolicyName',    # min: 1, max: 256; OPTIONAL
                },    # OPTIONAL
              },    # OPTIONAL
              ProvisionedReadCapacityUnits => 1,    # min: 1; OPTIONAL
            },
            ...
          ],                                        # min: 1, max: 20; OPTIONAL
          ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate => {
            AutoScalingDisabled => 1,               # OPTIONAL
            AutoScalingRoleArn =>
              'MyAutoScalingRoleArn',    # min: 1, max: 1600; OPTIONAL
            MaximumUnits        => 1,    # min: 1; OPTIONAL
            MinimumUnits        => 1,    # min: 1; OPTIONAL
            ScalingPolicyUpdate => {
              TargetTrackingScalingPolicyConfiguration => {
                TargetValue      => 1,
                DisableScaleIn   => 1,    # OPTIONAL
                ScaleInCooldown  => 1,    # OPTIONAL
                ScaleOutCooldown => 1,    # OPTIONAL
              },
              PolicyName =>
                'MyAutoScalingPolicyName',    # min: 1, max: 256; OPTIONAL
            },    # OPTIONAL
          },    # OPTIONAL
          ReplicaProvisionedReadCapacityUnits => 1,    # min: 1; OPTIONAL
        },
        ...
      ],                                               # OPTIONAL
    );

    # Results:
    my $GlobalTableName = $UpdateGlobalTableSettingsOutput->GlobalTableName;
    my $ReplicaSettings = $UpdateGlobalTableSettingsOutput->ReplicaSettings;

    # Returns a L<Paws::DynamoDB::UpdateGlobalTableSettingsOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/UpdateGlobalTableSettings>

=head1 ATTRIBUTES


=head2 GlobalTableBillingMode => Str

The billing mode of the global table. If C<GlobalTableBillingMode> is
not specified, the global table defaults to C<PROVISIONED> capacity
billing mode.

Valid values are: C<"PROVISIONED">, C<"PAY_PER_REQUEST">

=head2 GlobalTableGlobalSecondaryIndexSettingsUpdate => ArrayRef[L<Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate>]

Represents the settings of a global secondary index for a global table
that will be modified.



=head2 B<REQUIRED> GlobalTableName => Str

The name of the global table



=head2 GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate => L<Paws::DynamoDB::AutoScalingSettingsUpdate>

AutoScaling settings for managing provisioned write capacity for the
global table.



=head2 GlobalTableProvisionedWriteCapacityUnits => Int

The maximum number of writes consumed per second before DynamoDB
returns a C<ThrottlingException.>



=head2 ReplicaSettingsUpdate => ArrayRef[L<Paws::DynamoDB::ReplicaSettingsUpdate>]

Represents the settings for a global table in a region that will be
modified.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method UpdateGlobalTableSettings in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

