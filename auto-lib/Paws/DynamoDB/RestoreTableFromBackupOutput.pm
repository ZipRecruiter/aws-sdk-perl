
package Paws::DynamoDB::RestoreTableFromBackupOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has TableDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::TableDescription']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{TableDescription}) {
      $res{TableDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::TableDescription' ? $_ : do {
              require Paws::DynamoDB::TableDescription;
              Paws::DynamoDB::TableDescription->new_with_coercions($_);
              }
      } ($args->{TableDescription}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "TableDescription") {
        my $key = "TableDescription";
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
    if (exists $self->{TableDescription}) {
      $res{TableDescription} = (map {
            $_->to_hash_data
      } ($self->TableDescription))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{TableDescription}) {
      $res{TableDescription} = (map {
            $_->to_json_data
      } ($self->TableDescription))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{TableDescription}) {
      my $key = "${prefix}TableDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->TableDescription;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::RestoreTableFromBackupOutput

=head1 ATTRIBUTES


=head2 TableDescription => L<Paws::DynamoDB::TableDescription>

The description of the table created from an existing backup.


=head2 _request_id => Str


=cut

