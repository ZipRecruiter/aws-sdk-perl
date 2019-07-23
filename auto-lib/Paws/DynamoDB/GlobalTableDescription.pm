package Paws::DynamoDB::GlobalTableDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has CreationDateTime => (is => 'ro', isa => Str);
  has GlobalTableArn => (is => 'ro', isa => Str);
  has GlobalTableName => (is => 'ro', isa => Str);
  has GlobalTableStatus => (is => 'ro', isa => Str);
  has ReplicationGroup => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ReplicaDescription']]);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{CreationDateTime}) {
      $res{CreationDateTime} = (map {
            "$_"
      } ($args->{CreationDateTime}))[0];
    }
    if (exists $args->{GlobalTableArn}) {
      $res{GlobalTableArn} = (map {
            "$_"
      } ($args->{GlobalTableArn}))[0];
    }
    if (exists $args->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($args->{GlobalTableName}))[0];
    }
    if (exists $args->{GlobalTableStatus}) {
      $res{GlobalTableStatus} = (map {
            "$_"
      } ($args->{GlobalTableStatus}))[0];
    }
    if (exists $args->{ReplicationGroup}) {
      $res{ReplicationGroup} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::ReplicaDescription' ? $_ : do {
                  require Paws::DynamoDB::ReplicaDescription;
                  Paws::DynamoDB::ReplicaDescription->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{ReplicationGroup}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "CreationDateTime") {
        my $key = "CreationDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "GlobalTableArn") {
        my $key = "GlobalTableArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "GlobalTableName") {
        my $key = "GlobalTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "GlobalTableStatus") {
        my $key = "GlobalTableStatus";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ReplicationGroup") {
        my $key = "ReplicationGroup";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ReplicaDescription;
                Paws::DynamoDB::ReplicaDescription->new_from_xml($_);
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
    if (exists $self->{CreationDateTime}) {
      $res{CreationDateTime} = (map {
            "$_"
      } ($self->CreationDateTime))[0];
    }
    if (exists $self->{GlobalTableArn}) {
      $res{GlobalTableArn} = (map {
            "$_"
      } ($self->GlobalTableArn))[0];
    }
    if (exists $self->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($self->GlobalTableName))[0];
    }
    if (exists $self->{GlobalTableStatus}) {
      $res{GlobalTableStatus} = (map {
            "$_"
      } ($self->GlobalTableStatus))[0];
    }
    if (exists $self->{ReplicationGroup}) {
      $res{ReplicationGroup} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ReplicationGroup))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{CreationDateTime}) {
      $res{CreationDateTime} = (map {
            "$_"
      } ($self->CreationDateTime))[0];
    }
    if (exists $self->{GlobalTableArn}) {
      $res{GlobalTableArn} = (map {
            "$_"
      } ($self->GlobalTableArn))[0];
    }
    if (exists $self->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($self->GlobalTableName))[0];
    }
    if (exists $self->{GlobalTableStatus}) {
      $res{GlobalTableStatus} = (map {
            "$_"
      } ($self->GlobalTableStatus))[0];
    }
    if (exists $self->{ReplicationGroup}) {
      $res{ReplicationGroup} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->ReplicationGroup))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{CreationDateTime}) {
      my $key = "${prefix}CreationDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->CreationDateTime;
    }

    if (exists $self->{GlobalTableArn}) {
      my $key = "${prefix}GlobalTableArn";
      do {
            $res->{$key} = "$_";
      } for $self->GlobalTableArn;
    }

    if (exists $self->{GlobalTableName}) {
      my $key = "${prefix}GlobalTableName";
      do {
            $res->{$key} = "$_";
      } for $self->GlobalTableName;
    }

    if (exists $self->{GlobalTableStatus}) {
      my $key = "${prefix}GlobalTableStatus";
      do {
            $res->{$key} = "$_";
      } for $self->GlobalTableStatus;
    }

    if (exists $self->{ReplicationGroup}) {
      my $key = "${prefix}ReplicationGroup";
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
      } for $self->ReplicationGroup;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::GlobalTableDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::GlobalTableDescription object:

  $service_obj->Method(Att1 => { CreationDateTime => $value, ..., ReplicationGroup => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::GlobalTableDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->CreationDateTime

=head1 DESCRIPTION

Contains details about the global table.

=head1 ATTRIBUTES


=head2 CreationDateTime => Str

  The creation time of the global table.


=head2 GlobalTableArn => Str

  The unique identifier of the global table.


=head2 GlobalTableName => Str

  The global table name.


=head2 GlobalTableStatus => Str

  The current state of the global table:

=over

=item *

C<CREATING> - The global table is being created.

=item *

C<UPDATING> - The global table is being updated.

=item *

C<DELETING> - The global table is being deleted.

=item *

C<ACTIVE> - The global table is ready for use.

=back



=head2 ReplicationGroup => ArrayRef[L<Paws::DynamoDB::ReplicaDescription>]

  The regions where the global table has replicas.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
