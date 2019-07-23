
package Paws::DynamoDB::TransactWriteItemsOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has ConsumedCapacity => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::ConsumedCapacity']]);
  has ItemCollectionMetrics => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ItemCollectionMetricsPerTable']);

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
    if (exists $args->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            ref($_) eq 'Paws::DynamoDB::ItemCollectionMetricsPerTable' ? $_ : do {
              require Paws::DynamoDB::ItemCollectionMetricsPerTable;
              Paws::DynamoDB::ItemCollectionMetricsPerTable->new_with_coercions($_);
              }
      } ($args->{ItemCollectionMetrics}))[0];
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
      } elsif ($nodeName eq "ItemCollectionMetrics") {
        my $key = "ItemCollectionMetrics";
            do {
              require Paws::DynamoDB::ItemCollectionMetricsPerTable;
              Paws::DynamoDB::ItemCollectionMetricsPerTable->read_xml( $_, $res, $key );
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
    if (exists $self->{ConsumedCapacity}) {
      $res{ConsumedCapacity} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->ConsumedCapacity))[0];
    }
    if (exists $self->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            $_->to_hash_data
      } ($self->ItemCollectionMetrics))[0];
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
    if (exists $self->{ItemCollectionMetrics}) {
      $res{ItemCollectionMetrics} = (map {
            $_->to_json_data
      } ($self->ItemCollectionMetrics))[0];
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

    if (exists $self->{ItemCollectionMetrics}) {
      my $key = "${prefix}ItemCollectionMetrics";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ItemCollectionMetrics;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::TransactWriteItemsOutput

=head1 ATTRIBUTES


=head2 ConsumedCapacity => ArrayRef[L<Paws::DynamoDB::ConsumedCapacity>]

The capacity units consumed by the entire C<TransactWriteItems>
operation. The values of the list are ordered according to the ordering
of the C<TransactItems> request parameter.


=head2 ItemCollectionMetrics => L<Paws::DynamoDB::ItemCollectionMetricsPerTable>

A list of tables that were processed by C<TransactWriteItems> and, for
each table, information about any item collections that were affected
by individual C<UpdateItem>, C<PutItem> or C<DeleteItem> operations.


=head2 _request_id => Str


=cut

