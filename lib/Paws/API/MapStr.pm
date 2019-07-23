package Paws::API::MapStr;
  use Moose::Role;
  use namespace::clean -except => 'meta';

  sub ValueFor {
    my ($self, $key) = shift;
    my $value = $self->Map->{ $key };
    die "No value for $key" if not defined ($value);
    return $value;
  }
1;
