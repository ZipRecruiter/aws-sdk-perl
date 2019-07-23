package Paws::DynamoDB::AutoScalingSettingsUpdate;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has AutoScalingDisabled => (is => 'ro', isa => Bool);
  has AutoScalingRoleArn => (is => 'ro', isa => Str);
  has MaximumUnits => (is => 'ro', isa => Int);
  has MinimumUnits => (is => 'ro', isa => Int);
  has ScalingPolicyUpdate => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingPolicyUpdate']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{AutoScalingDisabled}) {
      $res{AutoScalingDisabled} = (map {
            0 + !!$_
      } ($args->{AutoScalingDisabled}))[0];
    }
    if (exists $args->{AutoScalingRoleArn}) {
      $res{AutoScalingRoleArn} = (map {
            "$_"
      } ($args->{AutoScalingRoleArn}))[0];
    }
    if (exists $args->{MaximumUnits}) {
      $res{MaximumUnits} = (map {
            int($_)
      } ($args->{MaximumUnits}))[0];
    }
    if (exists $args->{MinimumUnits}) {
      $res{MinimumUnits} = (map {
            int($_)
      } ($args->{MinimumUnits}))[0];
    }
    if (exists $args->{ScalingPolicyUpdate}) {
      $res{ScalingPolicyUpdate} = (map {
            ref($_) eq 'Paws::DynamoDB::AutoScalingPolicyUpdate' ? $_ : do {
              require Paws::DynamoDB::AutoScalingPolicyUpdate;
              Paws::DynamoDB::AutoScalingPolicyUpdate->new_with_coercions($_);
              }
      } ($args->{ScalingPolicyUpdate}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "AutoScalingDisabled") {
        my $key = "AutoScalingDisabled";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "AutoScalingRoleArn") {
        my $key = "AutoScalingRoleArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "MaximumUnits") {
        my $key = "MaximumUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "MinimumUnits") {
        my $key = "MinimumUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "ScalingPolicyUpdate") {
        my $key = "ScalingPolicyUpdate";
            $res->{$key} = do {
              require Paws::DynamoDB::AutoScalingPolicyUpdate;
              Paws::DynamoDB::AutoScalingPolicyUpdate->new_from_xml($_);
            };

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AutoScalingDisabled}) {
      $res{AutoScalingDisabled} = (map {
            0 + !!$_
      } ($self->AutoScalingDisabled))[0];
    }
    if (exists $self->{AutoScalingRoleArn}) {
      $res{AutoScalingRoleArn} = (map {
            "$_"
      } ($self->AutoScalingRoleArn))[0];
    }
    if (exists $self->{MaximumUnits}) {
      $res{MaximumUnits} = (map {
            int($_)
      } ($self->MaximumUnits))[0];
    }
    if (exists $self->{MinimumUnits}) {
      $res{MinimumUnits} = (map {
            int($_)
      } ($self->MinimumUnits))[0];
    }
    if (exists $self->{ScalingPolicyUpdate}) {
      $res{ScalingPolicyUpdate} = (map {
            $_->to_hash_data
      } ($self->ScalingPolicyUpdate))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AutoScalingDisabled}) {
      $res{AutoScalingDisabled} = (map {
            $_ ? \1 : \0
      } ($self->AutoScalingDisabled))[0];
    }
    if (exists $self->{AutoScalingRoleArn}) {
      $res{AutoScalingRoleArn} = (map {
            "$_"
      } ($self->AutoScalingRoleArn))[0];
    }
    if (exists $self->{MaximumUnits}) {
      $res{MaximumUnits} = (map {
            int($_)
      } ($self->MaximumUnits))[0];
    }
    if (exists $self->{MinimumUnits}) {
      $res{MinimumUnits} = (map {
            int($_)
      } ($self->MinimumUnits))[0];
    }
    if (exists $self->{ScalingPolicyUpdate}) {
      $res{ScalingPolicyUpdate} = (map {
            $_->to_json_data
      } ($self->ScalingPolicyUpdate))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{AutoScalingDisabled}) {
      my $key = "${prefix}AutoScalingDisabled";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->AutoScalingDisabled;
    }

    if (exists $self->{AutoScalingRoleArn}) {
      my $key = "${prefix}AutoScalingRoleArn";
      do {
            $res->{$key} = "$_";
      } for $self->AutoScalingRoleArn;
    }

    if (exists $self->{MaximumUnits}) {
      my $key = "${prefix}MaximumUnits";
      do {
            $res->{$key} = int($_);
      } for $self->MaximumUnits;
    }

    if (exists $self->{MinimumUnits}) {
      my $key = "${prefix}MinimumUnits";
      do {
            $res->{$key} = int($_);
      } for $self->MinimumUnits;
    }

    if (exists $self->{ScalingPolicyUpdate}) {
      my $key = "${prefix}ScalingPolicyUpdate";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ScalingPolicyUpdate;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::AutoScalingSettingsUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::AutoScalingSettingsUpdate object:

  $service_obj->Method(Att1 => { AutoScalingDisabled => $value, ..., ScalingPolicyUpdate => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::AutoScalingSettingsUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->AutoScalingDisabled

=head1 DESCRIPTION

Represents the autoscaling settings to be modified for a global table
or global secondary index.

=head1 ATTRIBUTES


=head2 AutoScalingDisabled => Bool

  Disabled autoscaling for this global table or global secondary index.


=head2 AutoScalingRoleArn => Str

  Role ARN used for configuring autoscaling policy.


=head2 MaximumUnits => Int

  The maximum capacity units that a global table or global secondary
index should be scaled up to.


=head2 MinimumUnits => Int

  The minimum capacity units that a global table or global secondary
index should be scaled down to.


=head2 ScalingPolicyUpdate => L<Paws::DynamoDB::AutoScalingPolicyUpdate>

  The scaling policy to apply for scaling target global table or global
secondary index capacity units.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
