package Paws::DynamoDB::ReplicaSettingsUpdate;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has RegionName => (is => 'ro', isa => Str, required => 1);
  has ReplicaGlobalSecondaryIndexSettingsUpdate => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate']]);
  has ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingSettingsUpdate']);
  has ReplicaProvisionedReadCapacityUnits => (is => 'ro', isa => Int);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{RegionName}) {
      $res{RegionName} = (map {
            "$_"
      } ($args->{RegionName}))[0];
    }
    if (exists $args->{ReplicaGlobalSecondaryIndexSettingsUpdate}) {
      $res{ReplicaGlobalSecondaryIndexSettingsUpdate} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate'
                  ? $_
                  : do {
                  require Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate;
                  Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate
                    ->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{ReplicaGlobalSecondaryIndexSettingsUpdate}))[0];
    }
    if (exists $args->{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      $res{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate} = (map {
            ref($_) eq 'Paws::DynamoDB::AutoScalingSettingsUpdate' ? $_ : do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_with_coercions($_);
              }
      } ($args->{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate}))[0];
    }
    if (exists $args->{ReplicaProvisionedReadCapacityUnits}) {
      $res{ReplicaProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($args->{ReplicaProvisionedReadCapacityUnits}))[0];
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
      } elsif ($nodeName eq "ReplicaGlobalSecondaryIndexSettingsUpdate") {
        my $key = "ReplicaGlobalSecondaryIndexSettingsUpdate";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate;
                Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate
                  ->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate") {
        my $key = "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate";
            $res->{$key} = do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_from_xml($_);
            };
      } elsif ($nodeName eq "ReplicaProvisionedReadCapacityUnits") {
        my $key = "ReplicaProvisionedReadCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );

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
    if (exists $self->{ReplicaGlobalSecondaryIndexSettingsUpdate}) {
      $res{ReplicaGlobalSecondaryIndexSettingsUpdate} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ReplicaGlobalSecondaryIndexSettingsUpdate))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      $res{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_hash_data
      } ($self->ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityUnits}) {
      $res{ReplicaProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($self->ReplicaProvisionedReadCapacityUnits))[0];
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
    if (exists $self->{ReplicaGlobalSecondaryIndexSettingsUpdate}) {
      $res{ReplicaGlobalSecondaryIndexSettingsUpdate} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->ReplicaGlobalSecondaryIndexSettingsUpdate))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      $res{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_json_data
      } ($self->ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{ReplicaProvisionedReadCapacityUnits}) {
      $res{ReplicaProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($self->ReplicaProvisionedReadCapacityUnits))[0];
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

    if (exists $self->{ReplicaGlobalSecondaryIndexSettingsUpdate}) {
      my $key = "${prefix}ReplicaGlobalSecondaryIndexSettingsUpdate";
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
      } for $self->ReplicaGlobalSecondaryIndexSettingsUpdate;
    }

    if (exists $self->{ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      my $key = "${prefix}ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate;
    }

    if (exists $self->{ReplicaProvisionedReadCapacityUnits}) {
      my $key = "${prefix}ReplicaProvisionedReadCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->ReplicaProvisionedReadCapacityUnits;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ReplicaSettingsUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ReplicaSettingsUpdate object:

  $service_obj->Method(Att1 => { RegionName => $value, ..., ReplicaProvisionedReadCapacityUnits => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ReplicaSettingsUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->RegionName

=head1 DESCRIPTION

Represents the settings for a global table in a region that will be
modified.

=head1 ATTRIBUTES


=head2 B<REQUIRED> RegionName => Str

  The region of the replica to be added.


=head2 ReplicaGlobalSecondaryIndexSettingsUpdate => ArrayRef[L<Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate>]

  Represents the settings of a global secondary index for a global table
that will be modified.


=head2 ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate => L<Paws::DynamoDB::AutoScalingSettingsUpdate>

  Autoscaling settings for managing a global table replica's read
capacity units.


=head2 ReplicaProvisionedReadCapacityUnits => Int

  The maximum number of strongly consistent reads consumed per second
before DynamoDB returns a C<ThrottlingException>. For more information,
see Specifying Read and Write Requirements
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
in the I<Amazon DynamoDB Developer Guide>.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
