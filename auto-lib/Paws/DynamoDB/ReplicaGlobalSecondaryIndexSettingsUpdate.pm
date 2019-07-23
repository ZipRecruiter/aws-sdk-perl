package Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has IndexName => (is => 'ro', isa => Str, required => 1);
  has ProvisionedReadCapacityAutoScalingSettingsUpdate => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingSettingsUpdate']);
  has ProvisionedReadCapacityUnits => (is => 'ro', isa => Int);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($args->{IndexName}))[0];
    }
    if (exists $args->{ProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      $res{ProvisionedReadCapacityAutoScalingSettingsUpdate} = (map {
            ref($_) eq 'Paws::DynamoDB::AutoScalingSettingsUpdate' ? $_ : do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_with_coercions($_);
              }
      } ($args->{ProvisionedReadCapacityAutoScalingSettingsUpdate}))[0];
    }
    if (exists $args->{ProvisionedReadCapacityUnits}) {
      $res{ProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($args->{ProvisionedReadCapacityUnits}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "IndexName") {
        my $key = "IndexName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ProvisionedReadCapacityAutoScalingSettingsUpdate") {
        my $key = "ProvisionedReadCapacityAutoScalingSettingsUpdate";
            $res->{$key} = do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_from_xml($_);
            };
      } elsif ($nodeName eq "ProvisionedReadCapacityUnits") {
        my $key = "ProvisionedReadCapacityUnits";
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
    if (exists $self->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($self->IndexName))[0];
    }
    if (exists $self->{ProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      $res{ProvisionedReadCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_hash_data
      } ($self->ProvisionedReadCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{ProvisionedReadCapacityUnits}) {
      $res{ProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($self->ProvisionedReadCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($self->IndexName))[0];
    }
    if (exists $self->{ProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      $res{ProvisionedReadCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_json_data
      } ($self->ProvisionedReadCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{ProvisionedReadCapacityUnits}) {
      $res{ProvisionedReadCapacityUnits} = (map {
            int($_)
      } ($self->ProvisionedReadCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{IndexName}) {
      my $key = "${prefix}IndexName";
      do {
            $res->{$key} = "$_";
      } for $self->IndexName;
    }

    if (exists $self->{ProvisionedReadCapacityAutoScalingSettingsUpdate}) {
      my $key = "${prefix}ProvisionedReadCapacityAutoScalingSettingsUpdate";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ProvisionedReadCapacityAutoScalingSettingsUpdate;
    }

    if (exists $self->{ProvisionedReadCapacityUnits}) {
      my $key = "${prefix}ProvisionedReadCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->ProvisionedReadCapacityUnits;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate object:

  $service_obj->Method(Att1 => { IndexName => $value, ..., ProvisionedReadCapacityUnits => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ReplicaGlobalSecondaryIndexSettingsUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->IndexName

=head1 DESCRIPTION

Represents the settings of a global secondary index for a global table
that will be modified.

=head1 ATTRIBUTES


=head2 B<REQUIRED> IndexName => Str

  The name of the global secondary index. The name must be unique among
all other indexes on this table.


=head2 ProvisionedReadCapacityAutoScalingSettingsUpdate => L<Paws::DynamoDB::AutoScalingSettingsUpdate>

  Autoscaling settings for managing a global secondary index replica's
read capacity units.


=head2 ProvisionedReadCapacityUnits => Int

  The maximum number of strongly consistent reads consumed per second
before DynamoDB returns a C<ThrottlingException>.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
