package Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has IndexName => (is => 'ro', isa => Str, required => 1);
  has ProvisionedWriteCapacityAutoScalingSettingsUpdate => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingSettingsUpdate']);
  has ProvisionedWriteCapacityUnits => (is => 'ro', isa => Int);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($args->{IndexName}))[0];
    }
    if (exists $args->{ProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      $res{ProvisionedWriteCapacityAutoScalingSettingsUpdate} = (map {
            ref($_) eq 'Paws::DynamoDB::AutoScalingSettingsUpdate' ? $_ : do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_with_coercions($_);
              }
      } ($args->{ProvisionedWriteCapacityAutoScalingSettingsUpdate}))[0];
    }
    if (exists $args->{ProvisionedWriteCapacityUnits}) {
      $res{ProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($args->{ProvisionedWriteCapacityUnits}))[0];
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
      } elsif ($nodeName eq "ProvisionedWriteCapacityAutoScalingSettingsUpdate") {
        my $key = "ProvisionedWriteCapacityAutoScalingSettingsUpdate";
            $res->{$key} = do {
              require Paws::DynamoDB::AutoScalingSettingsUpdate;
              Paws::DynamoDB::AutoScalingSettingsUpdate->new_from_xml($_);
            };
      } elsif ($nodeName eq "ProvisionedWriteCapacityUnits") {
        my $key = "ProvisionedWriteCapacityUnits";
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
    if (exists $self->{ProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      $res{ProvisionedWriteCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_hash_data
      } ($self->ProvisionedWriteCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{ProvisionedWriteCapacityUnits}) {
      $res{ProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($self->ProvisionedWriteCapacityUnits))[0];
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
    if (exists $self->{ProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      $res{ProvisionedWriteCapacityAutoScalingSettingsUpdate} = (map {
            $_->to_json_data
      } ($self->ProvisionedWriteCapacityAutoScalingSettingsUpdate))[0];
    }
    if (exists $self->{ProvisionedWriteCapacityUnits}) {
      $res{ProvisionedWriteCapacityUnits} = (map {
            int($_)
      } ($self->ProvisionedWriteCapacityUnits))[0];
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

    if (exists $self->{ProvisionedWriteCapacityAutoScalingSettingsUpdate}) {
      my $key = "${prefix}ProvisionedWriteCapacityAutoScalingSettingsUpdate";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ProvisionedWriteCapacityAutoScalingSettingsUpdate;
    }

    if (exists $self->{ProvisionedWriteCapacityUnits}) {
      my $key = "${prefix}ProvisionedWriteCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->ProvisionedWriteCapacityUnits;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate object:

  $service_obj->Method(Att1 => { IndexName => $value, ..., ProvisionedWriteCapacityUnits => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::GlobalTableGlobalSecondaryIndexSettingsUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->IndexName

=head1 DESCRIPTION

Represents the settings of a global secondary index for a global table
that will be modified.

=head1 ATTRIBUTES


=head2 B<REQUIRED> IndexName => Str

  The name of the global secondary index. The name must be unique among
all other indexes on this table.


=head2 ProvisionedWriteCapacityAutoScalingSettingsUpdate => L<Paws::DynamoDB::AutoScalingSettingsUpdate>

  AutoScaling settings for managing a global secondary index's write
capacity units.


=head2 ProvisionedWriteCapacityUnits => Int

  The maximum number of writes consumed per second before DynamoDB
returns a C<ThrottlingException.>



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
