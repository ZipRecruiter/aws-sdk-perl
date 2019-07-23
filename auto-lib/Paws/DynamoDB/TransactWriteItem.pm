package Paws::DynamoDB::TransactWriteItem;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has ConditionCheck => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ConditionCheck']);
  has Delete => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Delete']);
  has Put => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Put']);
  has Update => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Update']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ConditionCheck}) {
      $res{ConditionCheck} = (map {
            ref($_) eq 'Paws::DynamoDB::ConditionCheck' ? $_ : do {
              require Paws::DynamoDB::ConditionCheck;
              Paws::DynamoDB::ConditionCheck->new_with_coercions($_);
              }
      } ($args->{ConditionCheck}))[0];
    }
    if (exists $args->{Delete}) {
      $res{Delete} = (map {
            ref($_) eq 'Paws::DynamoDB::Delete' ? $_ : do {
              require Paws::DynamoDB::Delete;
              Paws::DynamoDB::Delete->new_with_coercions($_);
              }
      } ($args->{Delete}))[0];
    }
    if (exists $args->{Put}) {
      $res{Put} = (map {
            ref($_) eq 'Paws::DynamoDB::Put' ? $_ : do {
              require Paws::DynamoDB::Put;
              Paws::DynamoDB::Put->new_with_coercions($_);
              }
      } ($args->{Put}))[0];
    }
    if (exists $args->{Update}) {
      $res{Update} = (map {
            ref($_) eq 'Paws::DynamoDB::Update' ? $_ : do {
              require Paws::DynamoDB::Update;
              Paws::DynamoDB::Update->new_with_coercions($_);
              }
      } ($args->{Update}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ConditionCheck") {
        my $key = "ConditionCheck";
            $res->{$key} = do {
              require Paws::DynamoDB::ConditionCheck;
              Paws::DynamoDB::ConditionCheck->new_from_xml($_);
            };
      } elsif ($nodeName eq "Delete") {
        my $key = "Delete";
            $res->{$key} = do {
              require Paws::DynamoDB::Delete;
              Paws::DynamoDB::Delete->new_from_xml($_);
            };
      } elsif ($nodeName eq "Put") {
        my $key = "Put";
            $res->{$key} =
              do { require Paws::DynamoDB::Put; Paws::DynamoDB::Put->new_from_xml($_) };
      } elsif ($nodeName eq "Update") {
        my $key = "Update";
            $res->{$key} = do {
              require Paws::DynamoDB::Update;
              Paws::DynamoDB::Update->new_from_xml($_);
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
    if (exists $self->{ConditionCheck}) {
      $res{ConditionCheck} = (map {
            $_->to_hash_data
      } ($self->ConditionCheck))[0];
    }
    if (exists $self->{Delete}) {
      $res{Delete} = (map {
            $_->to_hash_data
      } ($self->Delete))[0];
    }
    if (exists $self->{Put}) {
      $res{Put} = (map {
            $_->to_hash_data
      } ($self->Put))[0];
    }
    if (exists $self->{Update}) {
      $res{Update} = (map {
            $_->to_hash_data
      } ($self->Update))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ConditionCheck}) {
      $res{ConditionCheck} = (map {
            $_->to_json_data
      } ($self->ConditionCheck))[0];
    }
    if (exists $self->{Delete}) {
      $res{Delete} = (map {
            $_->to_json_data
      } ($self->Delete))[0];
    }
    if (exists $self->{Put}) {
      $res{Put} = (map {
            $_->to_json_data
      } ($self->Put))[0];
    }
    if (exists $self->{Update}) {
      $res{Update} = (map {
            $_->to_json_data
      } ($self->Update))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ConditionCheck}) {
      my $key = "${prefix}ConditionCheck";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ConditionCheck;
    }

    if (exists $self->{Delete}) {
      my $key = "${prefix}Delete";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Delete;
    }

    if (exists $self->{Put}) {
      my $key = "${prefix}Put";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Put;
    }

    if (exists $self->{Update}) {
      my $key = "${prefix}Update";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Update;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::TransactWriteItem

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::TransactWriteItem object:

  $service_obj->Method(Att1 => { ConditionCheck => $value, ..., Update => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::TransactWriteItem object:

  $result = $service_obj->Method(...);
  $result->Att1->ConditionCheck

=head1 DESCRIPTION

A list of requests that can perform update, put, delete, or check
operations on multiple items in one or more tables atomically.

=head1 ATTRIBUTES


=head2 ConditionCheck => L<Paws::DynamoDB::ConditionCheck>

  A request to perform a check item operation.


=head2 Delete => L<Paws::DynamoDB::Delete>

  A request to perform a C<DeleteItem> operation.


=head2 Put => L<Paws::DynamoDB::Put>

  A request to perform a C<PutItem> operation.


=head2 Update => L<Paws::DynamoDB::Update>

  A request to perform an C<UpdateItem> operation.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
