package Paws::DynamoDB::Endpoint;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has Address => (is => 'ro', isa => Str, required => 1);
  has CachePeriodInMinutes => (is => 'ro', isa => Int, required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Address}) {
      $res{Address} = (map {
            "$_"
      } ($args->{Address}))[0];
    }
    if (exists $args->{CachePeriodInMinutes}) {
      $res{CachePeriodInMinutes} = (map {
            int($_)
      } ($args->{CachePeriodInMinutes}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Address") {
        my $key = "Address";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "CachePeriodInMinutes") {
        my $key = "CachePeriodInMinutes";
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
    if (exists $self->{Address}) {
      $res{Address} = (map {
            "$_"
      } ($self->Address))[0];
    }
    if (exists $self->{CachePeriodInMinutes}) {
      $res{CachePeriodInMinutes} = (map {
            int($_)
      } ($self->CachePeriodInMinutes))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Address}) {
      $res{Address} = (map {
            "$_"
      } ($self->Address))[0];
    }
    if (exists $self->{CachePeriodInMinutes}) {
      $res{CachePeriodInMinutes} = (map {
            int($_)
      } ($self->CachePeriodInMinutes))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Address}) {
      my $key = "${prefix}Address";
      do {
            $res->{$key} = "$_";
      } for $self->Address;
    }

    if (exists $self->{CachePeriodInMinutes}) {
      my $key = "${prefix}CachePeriodInMinutes";
      do {
            $res->{$key} = int($_);
      } for $self->CachePeriodInMinutes;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::Endpoint

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::Endpoint object:

  $service_obj->Method(Att1 => { Address => $value, ..., CachePeriodInMinutes => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::Endpoint object:

  $result = $service_obj->Method(...);
  $result->Att1->Address

=head1 DESCRIPTION

An endpoint information details.

=head1 ATTRIBUTES


=head2 B<REQUIRED> Address => Str

  IP address of the endpoint.


=head2 B<REQUIRED> CachePeriodInMinutes => Int

  Endpoint cache time to live (TTL) value.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
