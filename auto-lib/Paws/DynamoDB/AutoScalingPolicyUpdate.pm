package Paws::DynamoDB::AutoScalingPolicyUpdate;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has PolicyName => (is => 'ro', isa => Str);
  has TargetTrackingScalingPolicyConfiguration => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate'], required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{PolicyName}) {
      $res{PolicyName} = (map {
            "$_"
      } ($args->{PolicyName}))[0];
    }
    if (exists $args->{TargetTrackingScalingPolicyConfiguration}) {
      $res{TargetTrackingScalingPolicyConfiguration} = (map {
            ref($_) eq
        'Paws::DynamoDB::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate'
              ? $_
              : do {
              require
                Paws::DynamoDB::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate;
              Paws::DynamoDB::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
                ->new_with_coercions($_);
              }
      } ($args->{TargetTrackingScalingPolicyConfiguration}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "PolicyName") {
        my $key = "PolicyName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TargetTrackingScalingPolicyConfiguration") {
        my $key = "TargetTrackingScalingPolicyConfiguration";
            $res->{$key} = do {
              require
                Paws::DynamoDB::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate;
              Paws::DynamoDB::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
                ->new_from_xml($_);
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
    if (exists $self->{PolicyName}) {
      $res{PolicyName} = (map {
            "$_"
      } ($self->PolicyName))[0];
    }
    if (exists $self->{TargetTrackingScalingPolicyConfiguration}) {
      $res{TargetTrackingScalingPolicyConfiguration} = (map {
            $_->to_hash_data
      } ($self->TargetTrackingScalingPolicyConfiguration))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{PolicyName}) {
      $res{PolicyName} = (map {
            "$_"
      } ($self->PolicyName))[0];
    }
    if (exists $self->{TargetTrackingScalingPolicyConfiguration}) {
      $res{TargetTrackingScalingPolicyConfiguration} = (map {
            $_->to_json_data
      } ($self->TargetTrackingScalingPolicyConfiguration))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{PolicyName}) {
      my $key = "${prefix}PolicyName";
      do {
            $res->{$key} = "$_";
      } for $self->PolicyName;
    }

    if (exists $self->{TargetTrackingScalingPolicyConfiguration}) {
      my $key = "${prefix}TargetTrackingScalingPolicyConfiguration";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->TargetTrackingScalingPolicyConfiguration;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::AutoScalingPolicyUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::AutoScalingPolicyUpdate object:

  $service_obj->Method(Att1 => { PolicyName => $value, ..., TargetTrackingScalingPolicyConfiguration => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::AutoScalingPolicyUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->PolicyName

=head1 DESCRIPTION

Represents the autoscaling policy to be modified.

=head1 ATTRIBUTES


=head2 PolicyName => Str

  The name of the scaling policy.


=head2 B<REQUIRED> TargetTrackingScalingPolicyConfiguration => L<Paws::DynamoDB::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate>

  Represents a target tracking scaling policy configuration.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
