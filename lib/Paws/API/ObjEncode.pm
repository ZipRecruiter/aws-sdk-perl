package Paws::API::ObjEncode;
  use Moose::Role;
  use MooseX::ClassAttribute;
  use Types::Serialiser;
  use Types::Standard qw(ArrayRef);
  use namespace::clean -except => 'meta';

  class_has _attribute_list => (
    is      => 'ro',
    isa     => ArrayRef,
    default => sub { [] },
  );

  {
    my %_attribute_encoders = (
      'structure' => '_attribute_encode_obj',
      'map'       => '_attribute_encode_obj',
      'blob'      => '_attribute_encode_string',
      'string'    => '_attribute_encode_string',
      'integer'   => '_attribute_encode_integer',
      'boolean'   => '_attribute_encode_boolean',
      'float'     => '_attribute_encode_float',
      'double'    => '_attribute_encode_float',
      'long'      => '_attribute_encode_integer',
      'timestamp' => '_attribute_encode_string',
    );

    sub _add_attribute_encode {
      my ($class, %spec) = @_;

      my $method = $_attribute_encoders{$spec{type}};
      die "can't determine encoder for type " . $spec{type} unless $method;
      $spec{method} = $method;
      push @{$class->_attribute_list}, \%spec;
    }
  }

  sub _attribute_encode_obj {
    my ($self, $op, $spec, $val) = @_;
    return () unless defined $val;
    if ($op->{type} eq "json") {
      return ($val->TO_JSON_HASH);
    }
    return ($val->TO_HASH);
  }

  sub _attribute_encode_boolean {
    my ($self, $op, $spec, $val) = @_;
    return () if !defined $val && $spec->{depth} == 0;
    if ($op->{type} eq "json") {
      return $val ? $Types::Serialiser::true : $Types::Serialiser::false;
    } else {
      return $val;
    }
  }

  sub _attribute_encode_string {
    my ($self, $op, $spec, $val) = @_;
    return () if !defined $val && $spec->{depth} == 0;
    return undef if !defined $val;
    return ("$val");
  }

  sub _attribute_encode_integer {
    my ($self, $op, $spec, $val) = @_;
    return () unless defined $val;
    return (int($val));
  }

  sub _attribute_encode_float {
    my ($self, $op, $spec, $val) = @_;
    return () unless defined $val;
    return (0+$val);
  }

  sub _encode_depth {
    my ($self, $op, $cur_depth, $spec, $val) = @_;
    my $name = $spec->{name};
    #TODO: use predicates rather than all these if defined() checks
    $val //= $self->$name;

    if ($cur_depth < $spec->{depth}) {
      return () unless defined $val;
      return ([map {
        $self->_encode_depth($op, $cur_depth + 1, $spec, $_);
      } @$val]);
    }
    my $method = $spec->{method};
    return ($self->$method($op, $spec, $val));
  }

  sub _encode_type {
    my ($self, $op) = @_;

    my $res = {};
    for my $spec (@{$self->_attribute_list}) {
      my @encoded = $self->_encode_depth($op, 0, $spec);
      $res->{$spec->{name}} = $encoded[0] if @encoded;
    }
    return $res;
  }

  sub TO_JSON_HASH {
    my $self = shift;
    return $self->_encode_type({ type => 'json'});
  }

  sub TO_HASH {
    my $self = shift;
    return $self->_encode_type({ type => 'hash'});
  }

  sub TO_QUERY {
    my $self = shift;
  }

1;
