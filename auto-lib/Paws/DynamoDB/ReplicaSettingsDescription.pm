package Paws::DynamoDB::ReplicaSettingsDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has RegionName => (is => 'ro', isa => Str, required => 1);
  has ReplicaBillingModeSummary => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::BillingModeSummary']);
  has ReplicaGlobalSecondaryIndexSettings => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsDescription']]);
  has ReplicaProvisionedReadCapacityAutoScalingSettings => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingSettingsDescription']);
  has ReplicaProvisionedReadCapacityUnits => (is => 'ro', isa => Int);
  has ReplicaProvisionedWriteCapacityAutoScalingSettings => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingSettingsDescription']);
  has ReplicaProvisionedWriteCapacityUnits => (is => 'ro', isa => Int);
  has ReplicaStatus => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{RegionName}) {
      $res{RegionName} = (map {
            "$_"
      } ($args->{RegionName}))[0];
    }
    if (exists $args->{ReplicaBillingModeSummary}) {
      $res{ReplicaBillingModeSummary} = (map {
            ref($_) eq 'Paws::DynamoDB::BillingModeSummary' ? $_ : do {
              require Paws::DynamoDB::BillingModeSummary;
              Paws::DynamoDB::BillingModeSummary->new_with_coercions($_);
              }
      } ($args->{ReplicaBillingModeSummary}))[0];
    }
    if (exists $args->{ReplicaGlobalSecondaryIndexSettings}) {
      $res{ReplicaGlobalSecondaryIndexSettings} = (map {
            [
              map {
                ref($_) eq
                  'Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsDescription'
                  ? $_
                  : do {
                  require
                    Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsDescription;
                  Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsDescription
                    ->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{ReplicaGlobalSecondaryIndexSettings}))[0];
    }
    if (exists $args->{ReplicaProvisionedReadCapacityAutoScalingSettings}) {
      $res{ReplicaProvisionedReadCapacityAutoScalingSettings} = (map {
            ref($_) eq 'Paws::DynamoDB::AutoScalingSettingsDescription' ? $_ : do {
              require Paws::DynamoDB::AutoScalingSettingsDescription;
              Paws::DynamoDB::AutoScalingSettingsDescription->new_with_coercions($_);
              }
      } ($args->{ReplicaProvisionedReadCapacityAutoScalingSettings}))[0];
    }
    if (exists $args->{ReplicaProvisionedReadCapacityUnits}) {
      $res{ReplicaProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($args->{ReplicaProvisionedReadCapacityUnits}))[0];
    }
    if (exists $args->{ReplicaProvisionedWriteCapacityAutoScalingSettings}) {
      $res{ReplicaProvisionedWriteCapacityAutoScalingSettings} = (map {
            ref($_) eq 'Paws::DynamoDB::AutoScalingSettingsDescription' ? $_ : do {
              require Paws::DynamoDB::AutoScalingSettingsDescription;
              Paws::DynamoDB::AutoScalingSettingsDescription->new_with_coercions($_);
              }
      } ($args->{ReplicaProvisionedWriteCapacityAutoScalingSettings}))[0];
    }
    if (exists $args->{ReplicaProvisionedWriteCapacityUnits}) {
      $res{ReplicaProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($args->{ReplicaProvisionedWriteCapacityUnits}))[0];
    }
    if (exists $args->{ReplicaStatus}) {
      $res{ReplicaStatus} = (map {
            "$_"
      } ($args->{ReplicaStatus}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "RegionName") {
        my $key = "RegionName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ReplicaBillingModeSummary") {
        my $key = "ReplicaBillingModeSummary";
            $res->{$key} = do {
              require Paws::DynamoDB::BillingModeSummary;
              Paws::DynamoDB::BillingModeSummary->new_from_xml($_);
            };
      } elsif ($nodeName eq "ReplicaGlobalSecondaryIndexSettings") {
        my $key = "ReplicaGlobalSecondaryIndexSettings";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsDescription;
                Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsDescription
                  ->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "ReplicaProvisionedReadCapacityAutoScalingSettings") {
        my $key = "ReplicaProvisionedReadCapacityAutoScalingSettings";
            $res->{$key} = do {
              require Paws::DynamoDB::AutoScalingSettingsDescription;
              Paws::DynamoDB::AutoScalingSettingsDescription->new_from_xml($_);
            };
      } elsif ($nodeName eq "ReplicaProvisionedReadCapacityUnits") {
        my $key = "ReplicaProvisionedReadCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "ReplicaProvisionedWriteCapacityAutoScalingSettings") {
        my $key = "ReplicaProvisionedWriteCapacityAutoScalingSettings";
            $res->{$key} = do {
              require Paws::DynamoDB::AutoScalingSettingsDescription;
              Paws::DynamoDB::AutoScalingSettingsDescription->new_from_xml($_);
            };
      } elsif ($nodeName eq "ReplicaProvisionedWriteCapacityUnits") {
        my $key = "ReplicaProvisionedWriteCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "ReplicaStatus") {
        my $key = "ReplicaStatus";
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
    if (exists $self->{RegionName}) {
      $res{RegionName} = (map {
            "$_"
      } ($self->RegionName))[0];
    }
    if (exists $self->{ReplicaBillingModeSummary}) {
      $res{ReplicaBillingModeSummary} = (map {
            $_->to_hash_data
      } ($self->ReplicaBillingModeSummary))[0];
    }
    if (exists $self->{ReplicaGlobalSecondaryIndexSettings}) {
      $res{ReplicaGlobalSecondaryIndexSettings} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ReplicaGlobalSecondaryIndexSettings))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityAutoScalingSettings}) {
      $res{ReplicaProvisionedReadCapacityAutoScalingSettings} = (map {
            $_->to_hash_data
      } ($self->ReplicaProvisionedReadCapacityAutoScalingSettings))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityUnits}) {
      $res{ReplicaProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($self->ReplicaProvisionedReadCapacityUnits))[0];
    }
    if (exists $self->{ReplicaProvisionedWriteCapacityAutoScalingSettings}) {
      $res{ReplicaProvisionedWriteCapacityAutoScalingSettings} = (map {
            $_->to_hash_data
      } ($self->ReplicaProvisionedWriteCapacityAutoScalingSettings))[0];
    }
    if (exists $self->{ReplicaProvisionedWriteCapacityUnits}) {
      $res{ReplicaProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($self->ReplicaProvisionedWriteCapacityUnits))[0];
    }
    if (exists $self->{ReplicaStatus}) {
      $res{ReplicaStatus} = (map {
            "$_"
      } ($self->ReplicaStatus))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{RegionName}) {
      $res{RegionName} = (map {
            "$_"
      } ($self->RegionName))[0];
    }
    if (exists $self->{ReplicaBillingModeSummary}) {
      $res{ReplicaBillingModeSummary} = (map {
            $_->to_json_data
      } ($self->ReplicaBillingModeSummary))[0];
    }
    if (exists $self->{ReplicaGlobalSecondaryIndexSettings}) {
      $res{ReplicaGlobalSecondaryIndexSettings} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->ReplicaGlobalSecondaryIndexSettings))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityAutoScalingSettings}) {
      $res{ReplicaProvisionedReadCapacityAutoScalingSettings} = (map {
            $_->to_json_data
      } ($self->ReplicaProvisionedReadCapacityAutoScalingSettings))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityUnits}) {
      $res{ReplicaProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($self->ReplicaProvisionedReadCapacityUnits))[0];
    }
    if (exists $self->{ReplicaProvisionedWriteCapacityAutoScalingSettings}) {
      $res{ReplicaProvisionedWriteCapacityAutoScalingSettings} = (map {
            $_->to_json_data
      } ($self->ReplicaProvisionedWriteCapacityAutoScalingSettings))[0];
    }
    if (exists $self->{ReplicaProvisionedWriteCapacityUnits}) {
      $res{ReplicaProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($self->ReplicaProvisionedWriteCapacityUnits))[0];
    }
    if (exists $self->{ReplicaStatus}) {
      $res{ReplicaStatus} = (map {
            "$_"
      } ($self->ReplicaStatus))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{RegionName}) {
      my $key = "${prefix}RegionName";
      do {
            $res->{$key} = "$_";
      } for $self->RegionName;
    }

    if (exists $self->{ReplicaBillingModeSummary}) {
      my $key = "${prefix}ReplicaBillingModeSummary";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ReplicaBillingModeSummary;
    }

    if (exists $self->{ReplicaGlobalSecondaryIndexSettings}) {
      my $key = "${prefix}ReplicaGlobalSecondaryIndexSettings";
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
      } for $self->ReplicaGlobalSecondaryIndexSettings;
    }

    if (exists $self->{ReplicaProvisionedReadCapacityAutoScalingSettings}) {
      my $key = "${prefix}ReplicaProvisionedReadCapacityAutoScalingSettings";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ReplicaProvisionedReadCapacityAutoScalingSettings;
    }

    if (exists $self->{ReplicaProvisionedReadCapacityUnits}) {
      my $key = "${prefix}ReplicaProvisionedReadCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->ReplicaProvisionedReadCapacityUnits;
    }

    if (exists $self->{ReplicaProvisionedWriteCapacityAutoScalingSettings}) {
      my $key = "${prefix}ReplicaProvisionedWriteCapacityAutoScalingSettings";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ReplicaProvisionedWriteCapacityAutoScalingSettings;
    }

    if (exists $self->{ReplicaProvisionedWriteCapacityUnits}) {
      my $key = "${prefix}ReplicaProvisionedWriteCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->ReplicaProvisionedWriteCapacityUnits;
    }

    if (exists $self->{ReplicaStatus}) {
      my $key = "${prefix}ReplicaStatus";
      do {
            $res->{$key} = "$_";
      } for $self->ReplicaStatus;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ReplicaSettingsDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ReplicaSettingsDescription object:

  $service_obj->Method(Att1 => { RegionName => $value, ..., ReplicaStatus => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ReplicaSettingsDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->RegionName

=head1 DESCRIPTION

Represents the properties of a replica.

=head1 ATTRIBUTES


=head2 B<REQUIRED> RegionName => Str

  The region name of the replica.


=head2 ReplicaBillingModeSummary => L<Paws::DynamoDB::BillingModeSummary>

  The read/write capacity mode of the replica.


=head2 ReplicaGlobalSecondaryIndexSettings => ArrayRef[L<Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsDescription>]

  Replica global secondary index settings for the global table.


=head2 ReplicaProvisionedReadCapacityAutoScalingSettings => L<Paws::DynamoDB::AutoScalingSettingsDescription>

  Autoscaling settings for a global table replica's read capacity units.


=head2 ReplicaProvisionedReadCapacityUnits => Int

  The maximum number of strongly consistent reads consumed per second
before DynamoDB returns a C<ThrottlingException>. For more information,
see Specifying Read and Write Requirements
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
in the I<Amazon DynamoDB Developer Guide>.


=head2 ReplicaProvisionedWriteCapacityAutoScalingSettings => L<Paws::DynamoDB::AutoScalingSettingsDescription>

  AutoScaling settings for a global table replica's write capacity units.


=head2 ReplicaProvisionedWriteCapacityUnits => Int

  The maximum number of writes consumed per second before DynamoDB
returns a C<ThrottlingException>. For more information, see Specifying
Read and Write Requirements
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
in the I<Amazon DynamoDB Developer Guide>.


=head2 ReplicaStatus => Str

  The current state of the region:

=over

=item *

C<CREATING> - The region is being created.

=item *

C<UPDATING> - The region is being updated.

=item *

C<DELETING> - The region is being deleted.

=item *

C<ACTIVE> - The region is ready for use.

=back




=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
