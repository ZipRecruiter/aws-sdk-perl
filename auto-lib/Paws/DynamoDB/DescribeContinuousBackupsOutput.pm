
package Paws::DynamoDB::DescribeContinuousBackupsOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has ContinuousBackupsDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ContinuousBackupsDescription']);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ContinuousBackupsDescription}) {
      $res{ContinuousBackupsDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::ContinuousBackupsDescription' ? $_ : do {
              require Paws::DynamoDB::ContinuousBackupsDescription;
              Paws::DynamoDB::ContinuousBackupsDescription->new_with_coercions($_);
              }
      } ($args->{ContinuousBackupsDescription}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ContinuousBackupsDescription") {
        my $key = "ContinuousBackupsDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::ContinuousBackupsDescription;
              Paws::DynamoDB::ContinuousBackupsDescription->new_from_xml($_);
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
    if (exists $self->{ContinuousBackupsDescription}) {
      $res{ContinuousBackupsDescription} = (map {
            $_->to_hash_data
      } ($self->ContinuousBackupsDescription))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ContinuousBackupsDescription}) {
      $res{ContinuousBackupsDescription} = (map {
            $_->to_json_data
      } ($self->ContinuousBackupsDescription))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ContinuousBackupsDescription}) {
      my $key = "${prefix}ContinuousBackupsDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ContinuousBackupsDescription;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DescribeContinuousBackupsOutput

=head1 ATTRIBUTES


=head2 ContinuousBackupsDescription => L<Paws::DynamoDB::ContinuousBackupsDescription>

Represents the continuous backups and point in time recovery settings
on the table.


=head2 _request_id => Str


=cut

