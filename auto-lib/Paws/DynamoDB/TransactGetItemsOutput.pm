
package Paws::DynamoDB::TransactGetItemsOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has ConsumedCapacity => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ConsumedCapacity']]);
  has Responses => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ItemResponse']]);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::ConsumedCapacity' ? $_ : do {
                  require Paws::DynamoDB::ConsumedCapacity;
                  Paws::DynamoDB::ConsumedCapacity->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{ConsumedCapacity}))[0];
    }
    if (exists $args->{Responses}) {
      $res{Responses} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::ItemResponse' ? $_ : do {
                  require Paws::DynamoDB::ItemResponse;
                  Paws::DynamoDB::ItemResponse->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{Responses}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ConsumedCapacity") {
        my $key = "ConsumedCapacity";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ConsumedCapacity;
                Paws::DynamoDB::ConsumedCapacity->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "Responses") {
        my $key = "Responses";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::ItemResponse;
                Paws::DynamoDB::ItemResponse->new_from_xml($_);
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
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{Responses}) {
      $res{Responses} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->Responses))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{Responses}) {
      $res{Responses} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->Responses))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ConsumedCapacity}) {
      my $key = "${prefix}ConsumedCapacity";
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
      } for $self->ConsumedCapacity;
    }

    if (exists $self->{Responses}) {
      my $key = "${prefix}Responses";
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
      } for $self->Responses;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::TransactGetItemsOutput

=head1 ATTRIBUTES


=head2 ConsumedCapacity => ArrayRef[L<Paws::DynamoDB::ConsumedCapacity>]

If the I<ReturnConsumedCapacity> value was C<TOTAL>, this is an array
of C<ConsumedCapacity> objects, one for each table addressed by
C<TransactGetItem> objects in the I<TransactItems> parameter. These
C<ConsumedCapacity> objects report the read-capacity units consumed by
the C<TransactGetItems> call in that table.


=head2 Responses => ArrayRef[L<Paws::DynamoDB::ItemResponse>]

An ordered array of up to 10 C<ItemResponse> objects, each of which
corresponds to the C<TransactGetItem> object in the same position in
the I<TransactItems> array. Each C<ItemResponse> object contains a Map
of the name-value pairs that are the projected attributes of the
requested item.

If a requested item could not be retrieved, the corresponding
C<ItemResponse> object is Null, or if the requested item has no
projected attributes, the corresponding C<ItemResponse> object is an
empty Map.


=head2 _request_id => Str


=cut

