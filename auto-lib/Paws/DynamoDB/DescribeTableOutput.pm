
package Paws::DynamoDB::DescribeTableOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has Table => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::TableDescription']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Table}) {
      $res{Table} = (map {
            ref($_) eq 'Paws::DynamoDB::TableDescription' ? $_ : do {
              require Paws::DynamoDB::TableDescription;
              Paws::DynamoDB::TableDescription->new_with_coercions($_);
              }
      } ($args->{Table}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Table") {
        my $key = "Table";
            $res->{$key} = do {
              require Paws::DynamoDB::TableDescription;
              Paws::DynamoDB::TableDescription->new_from_xml($_);
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
    if (exists $self->{Table}) {
      $res{Table} = (map {
            $_->to_hash_data
      } ($self->Table))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Table}) {
      $res{Table} = (map {
            $_->to_json_data
      } ($self->Table))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Table}) {
      my $key = "${prefix}Table";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Table;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DescribeTableOutput

=head1 ATTRIBUTES


=head2 Table => L<Paws::DynamoDB::TableDescription>

The properties of the table.


=head2 _request_id => Str


=cut

