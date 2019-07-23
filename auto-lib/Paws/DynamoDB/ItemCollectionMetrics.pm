package Paws::DynamoDB::ItemCollectionMetrics;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has ItemCollectionKey => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ItemCollectionKeyAttributeMap']);
  has SizeEstimateRangeGB => (is => 'ro', isa => ArrayRef[Num]);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ItemCollectionKey}) {
      $res{ItemCollectionKey} = (map {
            ref($_) eq 'Paws::DynamoDB::ItemCollectionKeyAttributeMap' ? $_ : do {
              require Paws::DynamoDB::ItemCollectionKeyAttributeMap;
              Paws::DynamoDB::ItemCollectionKeyAttributeMap->new_with_coercions($_);
              }
      } ($args->{ItemCollectionKey}))[0];
    }
    if (exists $args->{SizeEstimateRangeGB}) {
      $res{SizeEstimateRangeGB} = (map {
            [ map { 0 + $_ } @$_ ]
      } ($args->{SizeEstimateRangeGB}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ItemCollectionKey") {
        my $key = "ItemCollectionKey";
            do {
              require Paws::DynamoDB::ItemCollectionKeyAttributeMap;
              Paws::DynamoDB::ItemCollectionKeyAttributeMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "SizeEstimateRangeGB") {
        my $key = "SizeEstimateRangeGB";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = 0 + ( $_->nodeValue // 0 );
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
    if (exists $self->{ItemCollectionKey}) {
      $res{ItemCollectionKey} = (map {
            $_->to_hash_data
      } ($self->ItemCollectionKey))[0];
    }
    if (exists $self->{SizeEstimateRangeGB}) {
      $res{SizeEstimateRangeGB} = (map {
            [ map { 0 + $_ } @$_ ]
      } ($self->SizeEstimateRangeGB))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ItemCollectionKey}) {
      $res{ItemCollectionKey} = (map {
            $_->to_json_data
      } ($self->ItemCollectionKey))[0];
    }
    if (exists $self->{SizeEstimateRangeGB}) {
      $res{SizeEstimateRangeGB} = (map {
            [ map { 0 + $_ } @$_ ]
      } ($self->SizeEstimateRangeGB))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ItemCollectionKey}) {
      my $key = "${prefix}ItemCollectionKey";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ItemCollectionKey;
    }

    if (exists $self->{SizeEstimateRangeGB}) {
      my $key = "${prefix}SizeEstimateRangeGB";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $res->{$key} = 0 + $_;
                }
                for $val;
            }
      } for $self->SizeEstimateRangeGB;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ItemCollectionMetrics

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ItemCollectionMetrics object:

  $service_obj->Method(Att1 => { ItemCollectionKey => $value, ..., SizeEstimateRangeGB => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ItemCollectionMetrics object:

  $result = $service_obj->Method(...);
  $result->Att1->ItemCollectionKey

=head1 DESCRIPTION

Information about item collections, if any, that were affected by the
operation. C<ItemCollectionMetrics> is only returned if the request
asked for it. If the table does not have any local secondary indexes,
this information is not returned in the response.

=head1 ATTRIBUTES


=head2 ItemCollectionKey => L<Paws::DynamoDB::ItemCollectionKeyAttributeMap>

  The partition key value of the item collection. This value is the same
as the partition key value of the item.


=head2 SizeEstimateRangeGB => ArrayRef[Num]

  An estimate of item collection size, in gigabytes. This value is a
two-element array containing a lower bound and an upper bound for the
estimate. The estimate includes the size of all the items in the table,
plus the size of all attributes projected into all of the local
secondary indexes on that table. Use this estimate to measure whether a
local secondary index is approaching its size limit.

The estimate is subject to change over time; therefore, do not rely on
the precision or accuracy of the estimate.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
