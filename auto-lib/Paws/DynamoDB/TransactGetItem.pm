package Paws::DynamoDB::TransactGetItem;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has Get => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Get'], required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Get}) {
      $res{Get} = (map {
            ref($_) eq 'Paws::DynamoDB::Get' ? $_ : do {
              require Paws::DynamoDB::Get;
              Paws::DynamoDB::Get->new_with_coercions($_);
              }
      } ($args->{Get}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Get") {
        my $key = "Get";
            $res->{$key} =
              do { require Paws::DynamoDB::Get; Paws::DynamoDB::Get->new_from_xml($_) };

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Get}) {
      $res{Get} = (map {
            $_->to_hash_data
      } ($self->Get))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Get}) {
      $res{Get} = (map {
            $_->to_json_data
      } ($self->Get))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Get}) {
      my $key = "${prefix}Get";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Get;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::TransactGetItem

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::TransactGetItem object:

  $service_obj->Method(Att1 => { Get => $value, ..., Get => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::TransactGetItem object:

  $result = $service_obj->Method(...);
  $result->Att1->Get

=head1 DESCRIPTION

Specifies an item to be retrieved as part of the transaction.

=head1 ATTRIBUTES


=head2 B<REQUIRED> Get => L<Paws::DynamoDB::Get>

  Contains the primary key that identifies the item to get, together with
the name of the table that contains the item, and optionally the
specific attributes of the item to retrieve.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
