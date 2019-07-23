package Paws::DynamoDB::ReplicaUpdate;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has Create => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::CreateReplicaAction']);
  has Delete => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::DeleteReplicaAction']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Create}) {
      $res{Create} = (map {
            ref($_) eq 'Paws::DynamoDB::CreateReplicaAction' ? $_ : do {
              require Paws::DynamoDB::CreateReplicaAction;
              Paws::DynamoDB::CreateReplicaAction->new_with_coercions($_);
              }
      } ($args->{Create}))[0];
    }
    if (exists $args->{Delete}) {
      $res{Delete} = (map {
            ref($_) eq 'Paws::DynamoDB::DeleteReplicaAction' ? $_ : do {
              require Paws::DynamoDB::DeleteReplicaAction;
              Paws::DynamoDB::DeleteReplicaAction->new_with_coercions($_);
              }
      } ($args->{Delete}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Create") {
        my $key = "Create";
            $res->{$key} = do {
              require Paws::DynamoDB::CreateReplicaAction;
              Paws::DynamoDB::CreateReplicaAction->new_from_xml($_);
            };
      } elsif ($nodeName eq "Delete") {
        my $key = "Delete";
            $res->{$key} = do {
              require Paws::DynamoDB::DeleteReplicaAction;
              Paws::DynamoDB::DeleteReplicaAction->new_from_xml($_);
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
    if (exists $self->{Create}) {
      $res{Create} = (map {
            $_->to_hash_data
      } ($self->Create))[0];
    }
    if (exists $self->{Delete}) {
      $res{Delete} = (map {
            $_->to_hash_data
      } ($self->Delete))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Create}) {
      $res{Create} = (map {
            $_->to_json_data
      } ($self->Create))[0];
    }
    if (exists $self->{Delete}) {
      $res{Delete} = (map {
            $_->to_json_data
      } ($self->Delete))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Create}) {
      my $key = "${prefix}Create";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Create;
    }

    if (exists $self->{Delete}) {
      my $key = "${prefix}Delete";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Delete;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ReplicaUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ReplicaUpdate object:

  $service_obj->Method(Att1 => { Create => $value, ..., Delete => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ReplicaUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->Create

=head1 DESCRIPTION

Represents one of the following:

=over

=item *

A new replica to be added to an existing global table.

=item *

New parameters for an existing replica.

=item *

An existing replica to be removed from an existing global table.

=back


=head1 ATTRIBUTES


=head2 Create => L<Paws::DynamoDB::CreateReplicaAction>

  The parameters required for creating a replica on an existing global
table.


=head2 Delete => L<Paws::DynamoDB::DeleteReplicaAction>

  The name of the existing replica to be removed.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
