
package Paws::DynamoDB::DescribeLimitsOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has AccountMaxReadCapacityUnits => (is => 'ro', isa => Int);
  has AccountMaxWriteCapacityUnits => (is => 'ro', isa => Int);
  has TableMaxReadCapacityUnits => (is => 'ro', isa => Int);
  has TableMaxWriteCapacityUnits => (is => 'ro', isa => Int);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{AccountMaxReadCapacityUnits}) {
      $res{AccountMaxReadCapacityUnits} = (map {
            int($_)
      } ($args->{AccountMaxReadCapacityUnits}))[0];
    }
    if (exists $args->{AccountMaxWriteCapacityUnits}) {
      $res{AccountMaxWriteCapacityUnits} = (map {
            int($_)
      } ($args->{AccountMaxWriteCapacityUnits}))[0];
    }
    if (exists $args->{TableMaxReadCapacityUnits}) {
      $res{TableMaxReadCapacityUnits} = (map {
            int($_)
      } ($args->{TableMaxReadCapacityUnits}))[0];
    }
    if (exists $args->{TableMaxWriteCapacityUnits}) {
      $res{TableMaxWriteCapacityUnits} = (map {
            int($_)
      } ($args->{TableMaxWriteCapacityUnits}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "AccountMaxReadCapacityUnits") {
        my $key = "AccountMaxReadCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "AccountMaxWriteCapacityUnits") {
        my $key = "AccountMaxWriteCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "TableMaxReadCapacityUnits") {
        my $key = "TableMaxReadCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "TableMaxWriteCapacityUnits") {
        my $key = "TableMaxWriteCapacityUnits";
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
    if (exists $self->{AccountMaxReadCapacityUnits}) {
      $res{AccountMaxReadCapacityUnits} = (map {
            int($_)
      } ($self->AccountMaxReadCapacityUnits))[0];
    }
    if (exists $self->{AccountMaxWriteCapacityUnits}) {
      $res{AccountMaxWriteCapacityUnits} = (map {
            int($_)
      } ($self->AccountMaxWriteCapacityUnits))[0];
    }
    if (exists $self->{TableMaxReadCapacityUnits}) {
      $res{TableMaxReadCapacityUnits} = (map {
            int($_)
      } ($self->TableMaxReadCapacityUnits))[0];
    }
    if (exists $self->{TableMaxWriteCapacityUnits}) {
      $res{TableMaxWriteCapacityUnits} = (map {
            int($_)
      } ($self->TableMaxWriteCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AccountMaxReadCapacityUnits}) {
      $res{AccountMaxReadCapacityUnits} = (map {
            int($_)
      } ($self->AccountMaxReadCapacityUnits))[0];
    }
    if (exists $self->{AccountMaxWriteCapacityUnits}) {
      $res{AccountMaxWriteCapacityUnits} = (map {
            int($_)
      } ($self->AccountMaxWriteCapacityUnits))[0];
    }
    if (exists $self->{TableMaxReadCapacityUnits}) {
      $res{TableMaxReadCapacityUnits} = (map {
            int($_)
      } ($self->TableMaxReadCapacityUnits))[0];
    }
    if (exists $self->{TableMaxWriteCapacityUnits}) {
      $res{TableMaxWriteCapacityUnits} = (map {
            int($_)
      } ($self->TableMaxWriteCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{AccountMaxReadCapacityUnits}) {
      my $key = "${prefix}AccountMaxReadCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->AccountMaxReadCapacityUnits;
    }

    if (exists $self->{AccountMaxWriteCapacityUnits}) {
      my $key = "${prefix}AccountMaxWriteCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->AccountMaxWriteCapacityUnits;
    }

    if (exists $self->{TableMaxReadCapacityUnits}) {
      my $key = "${prefix}TableMaxReadCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->TableMaxReadCapacityUnits;
    }

    if (exists $self->{TableMaxWriteCapacityUnits}) {
      my $key = "${prefix}TableMaxWriteCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->TableMaxWriteCapacityUnits;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DescribeLimitsOutput

=head1 ATTRIBUTES


=head2 AccountMaxReadCapacityUnits => Int

The maximum total read capacity units that your account allows you to
provision across all of your tables in this region.


=head2 AccountMaxWriteCapacityUnits => Int

The maximum total write capacity units that your account allows you to
provision across all of your tables in this region.


=head2 TableMaxReadCapacityUnits => Int

The maximum read capacity units that your account allows you to
provision for a new table that you are creating in this region,
including the read capacity units provisioned for its global secondary
indexes (GSIs).


=head2 TableMaxWriteCapacityUnits => Int

The maximum write capacity units that your account allows you to
provision for a new table that you are creating in this region,
including the write capacity units provisioned for its global secondary
indexes (GSIs).


=head2 _request_id => Str


=cut

