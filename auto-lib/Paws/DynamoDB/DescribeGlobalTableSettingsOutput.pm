
package Paws::DynamoDB::DescribeGlobalTableSettingsOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has GlobalTableName => (is => 'ro', isa => Str);
  has ReplicaSettings => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ReplicaSettingsDescription']]);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($args->{GlobalTableName}))[0];
    }
    if (exists $args->{ReplicaSettings}) {
      $res{ReplicaSettings} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::ReplicaSettingsDescription' ? $_ : do {
                  require Paws::DynamoDB::ReplicaSettingsDescription;
                  Paws::DynamoDB::ReplicaSettingsDescription->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{ReplicaSettings}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "GlobalTableName") {
        my $key = "GlobalTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ReplicaSettings") {
        my $key = "ReplicaSettings";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ReplicaSettingsDescription;
                Paws::DynamoDB::ReplicaSettingsDescription->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($self->GlobalTableName))[0];
    }
    if (exists $self->{ReplicaSettings}) {
      $res{ReplicaSettings} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ReplicaSettings))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{GlobalTableName}) {
      $res{GlobalTableName} = (map {
            "$_"
      } ($self->GlobalTableName))[0];
    }
    if (exists $self->{ReplicaSettings}) {
      $res{ReplicaSettings} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->ReplicaSettings))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{GlobalTableName}) {
      my $key = "${prefix}GlobalTableName";
      do {
            $res->{$key} = "$_";
      } for $self->GlobalTableName;
    }

    if (exists $self->{ReplicaSettings}) {
      my $key = "${prefix}ReplicaSettings";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $_->to_parameter_data( $res, $key );
                }
                for $val;
            }
      } for $self->ReplicaSettings;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::DescribeGlobalTableSettingsOutput

=head1 ATTRIBUTES


=head2 GlobalTableName => Str

The name of the global table.


=head2 ReplicaSettings => ArrayRef[L<Paws::DynamoDB::ReplicaSettingsDescription>]

The region specific settings for the global table.


=head2 _request_id => Str


=cut

