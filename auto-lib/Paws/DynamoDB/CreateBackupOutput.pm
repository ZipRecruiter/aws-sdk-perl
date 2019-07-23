
package Paws::DynamoDB::CreateBackupOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has BackupDetails => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::BackupDetails']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupDetails}) {
      $res{BackupDetails} = (map {
            ref($_) eq 'Paws::DynamoDB::BackupDetails' ? $_ : do {
              require Paws::DynamoDB::BackupDetails;
              Paws::DynamoDB::BackupDetails->new_with_coercions($_);
              }
      } ($args->{BackupDetails}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "BackupDetails") {
        my $key = "BackupDetails";
            $res->{$key} = do {
              require Paws::DynamoDB::BackupDetails;
              Paws::DynamoDB::BackupDetails->new_from_xml($_);
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
    if (exists $self->{BackupDetails}) {
      $res{BackupDetails} = (map {
            $_->to_hash_data
      } ($self->BackupDetails))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BackupDetails}) {
      $res{BackupDetails} = (map {
            $_->to_json_data
      } ($self->BackupDetails))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{BackupDetails}) {
      my $key = "${prefix}BackupDetails";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->BackupDetails;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::CreateBackupOutput

=head1 ATTRIBUTES


=head2 BackupDetails => L<Paws::DynamoDB::BackupDetails>

Contains the details of the backup created for the table.


=head2 _request_id => Str


=cut

