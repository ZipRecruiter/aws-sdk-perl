
package Paws::DynamoDB::DescribeBackupOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has BackupDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::BackupDescription']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupDescription}) {
      $res{BackupDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::BackupDescription' ? $_ : do {
              require Paws::DynamoDB::BackupDescription;
              Paws::DynamoDB::BackupDescription->new_with_coercions($_);
              }
      } ($args->{BackupDescription}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "BackupDescription") {
        my $key = "BackupDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::BackupDescription;
              Paws::DynamoDB::BackupDescription->new_from_xml($_);
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
    if (exists $self->{BackupDescription}) {
      $res{BackupDescription} = (map {
            $_->to_hash_data
      } ($self->BackupDescription))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BackupDescription}) {
      $res{BackupDescription} = (map {
            $_->to_json_data
      } ($self->BackupDescription))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{BackupDescription}) {
      my $key = "${prefix}BackupDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->BackupDescription;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DescribeBackupOutput

=head1 ATTRIBUTES


=head2 BackupDescription => L<Paws::DynamoDB::BackupDescription>

Contains the description of the backup created for the table.


=head2 _request_id => Str


=cut

