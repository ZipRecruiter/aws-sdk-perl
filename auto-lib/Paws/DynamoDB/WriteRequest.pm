package Paws::DynamoDB::WriteRequest;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has DeleteRequest => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::DeleteRequest']);
  has PutRequest => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::PutRequest']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{DeleteRequest}) {
      $res{DeleteRequest} = (map {
            ref($_) eq 'Paws::DynamoDB::DeleteRequest' ? $_ : do {
              require Paws::DynamoDB::DeleteRequest;
              Paws::DynamoDB::DeleteRequest->new_with_coercions($_);
              }
      } ($args->{DeleteRequest}))[0];
    }
    if (exists $args->{PutRequest}) {
      $res{PutRequest} = (map {
            ref($_) eq 'Paws::DynamoDB::PutRequest' ? $_ : do {
              require Paws::DynamoDB::PutRequest;
              Paws::DynamoDB::PutRequest->new_with_coercions($_);
              }
      } ($args->{PutRequest}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "DeleteRequest") {
        my $key = "DeleteRequest";
            $res->{$key} = do {
              require Paws::DynamoDB::DeleteRequest;
              Paws::DynamoDB::DeleteRequest->new_from_xml($_);
            };
      } elsif ($nodeName eq "PutRequest") {
        my $key = "PutRequest";
            $res->{$key} = do {
              require Paws::DynamoDB::PutRequest;
              Paws::DynamoDB::PutRequest->new_from_xml($_);
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
    if (exists $self->{DeleteRequest}) {
      $res{DeleteRequest} = (map {
            $_->to_hash_data
      } ($self->DeleteRequest))[0];
    }
    if (exists $self->{PutRequest}) {
      $res{PutRequest} = (map {
            $_->to_hash_data
      } ($self->PutRequest))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{DeleteRequest}) {
      $res{DeleteRequest} = (map {
            $_->to_json_data
      } ($self->DeleteRequest))[0];
    }
    if (exists $self->{PutRequest}) {
      $res{PutRequest} = (map {
            $_->to_json_data
      } ($self->PutRequest))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{DeleteRequest}) {
      my $key = "${prefix}DeleteRequest";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->DeleteRequest;
    }

    if (exists $self->{PutRequest}) {
      my $key = "${prefix}PutRequest";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->PutRequest;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::WriteRequest

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::WriteRequest object:

  $service_obj->Method(Att1 => { DeleteRequest => $value, ..., PutRequest => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::WriteRequest object:

  $result = $service_obj->Method(...);
  $result->Att1->DeleteRequest

=head1 DESCRIPTION

Represents an operation to perform - either C<DeleteItem> or
C<PutItem>. You can only request one of these operations, not both, in
a single C<WriteRequest>. If you do need to perform both of these
operations, you will need to provide two separate C<WriteRequest>
objects.

=head1 ATTRIBUTES


=head2 DeleteRequest => L<Paws::DynamoDB::DeleteRequest>

  A request to perform a C<DeleteItem> operation.


=head2 PutRequest => L<Paws::DynamoDB::PutRequest>

  A request to perform a C<PutItem> operation.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
