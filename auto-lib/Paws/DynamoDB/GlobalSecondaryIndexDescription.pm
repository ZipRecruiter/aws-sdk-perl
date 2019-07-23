package Paws::DynamoDB::GlobalSecondaryIndexDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has Backfilling => (is => 'ro', isa => Bool);
  has IndexArn => (is => 'ro', isa => Str);
  has IndexName => (is => 'ro', isa => Str);
  has IndexSizeBytes => (is => 'ro', isa => Int);
  has IndexStatus => (is => 'ro', isa => Str);
  has ItemCount => (is => 'ro', isa => Int);
  has KeySchema => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::KeySchemaElement']]);
  has Projection => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Projection']);
  has ProvisionedThroughput => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ProvisionedThroughputDescription']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Backfilling}) {
      $res{Backfilling} = (map {
            0 + !!$_
      } ($args->{Backfilling}))[0];
    }
    if (exists $args->{IndexArn}) {
      $res{IndexArn} = (map {
            "$_"
      } ($args->{IndexArn}))[0];
    }
    if (exists $args->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($args->{IndexName}))[0];
    }
    if (exists $args->{IndexSizeBytes}) {
      $res{IndexSizeBytes} = (map {
            int($_)
      } ($args->{IndexSizeBytes}))[0];
    }
    if (exists $args->{IndexStatus}) {
      $res{IndexStatus} = (map {
            "$_"
      } ($args->{IndexStatus}))[0];
    }
    if (exists $args->{ItemCount}) {
      $res{ItemCount} = (map {
            int($_)
      } ($args->{ItemCount}))[0];
    }
    if (exists $args->{KeySchema}) {
      $res{KeySchema} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::KeySchemaElement' ? $_ : do {
                  require Paws::DynamoDB::KeySchemaElement;
                  Paws::DynamoDB::KeySchemaElement->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{KeySchema}))[0];
    }
    if (exists $args->{Projection}) {
      $res{Projection} = (map {
            ref($_) eq 'Paws::DynamoDB::Projection' ? $_ : do {
              require Paws::DynamoDB::Projection;
              Paws::DynamoDB::Projection->new_with_coercions($_);
              }
      } ($args->{Projection}))[0];
    }
    if (exists $args->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            ref($_) eq 'Paws::DynamoDB::ProvisionedThroughputDescription' ? $_ : do {
              require Paws::DynamoDB::ProvisionedThroughputDescription;
              Paws::DynamoDB::ProvisionedThroughputDescription->new_with_coercions($_);
              }
      } ($args->{ProvisionedThroughput}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Backfilling") {
        my $key = "Backfilling";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "IndexArn") {
        my $key = "IndexArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "IndexName") {
        my $key = "IndexName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "IndexSizeBytes") {
        my $key = "IndexSizeBytes";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "IndexStatus") {
        my $key = "IndexStatus";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ItemCount") {
        my $key = "ItemCount";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "KeySchema") {
        my $key = "KeySchema";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::KeySchemaElement;
                Paws::DynamoDB::KeySchemaElement->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "Projection") {
        my $key = "Projection";
            $res->{$key} = do {
              require Paws::DynamoDB::Projection;
              Paws::DynamoDB::Projection->new_from_xml($_);
            };
      } elsif ($nodeName eq "ProvisionedThroughput") {
        my $key = "ProvisionedThroughput";
            $res->{$key} = do {
              require Paws::DynamoDB::ProvisionedThroughputDescription;
              Paws::DynamoDB::ProvisionedThroughputDescription->new_from_xml($_);
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
    if (exists $self->{Backfilling}) {
      $res{Backfilling} = (map {
            0 + !!$_
      } ($self->Backfilling))[0];
    }
    if (exists $self->{IndexArn}) {
      $res{IndexArn} = (map {
            "$_"
      } ($self->IndexArn))[0];
    }
    if (exists $self->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($self->IndexName))[0];
    }
    if (exists $self->{IndexSizeBytes}) {
      $res{IndexSizeBytes} = (map {
            int($_)
      } ($self->IndexSizeBytes))[0];
    }
    if (exists $self->{IndexStatus}) {
      $res{IndexStatus} = (map {
            "$_"
      } ($self->IndexStatus))[0];
    }
    if (exists $self->{ItemCount}) {
      $res{ItemCount} = (map {
            int($_)
      } ($self->ItemCount))[0];
    }
    if (exists $self->{KeySchema}) {
      $res{KeySchema} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->KeySchema))[0];
    }
    if (exists $self->{Projection}) {
      $res{Projection} = (map {
            $_->to_hash_data
      } ($self->Projection))[0];
    }
    if (exists $self->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            $_->to_hash_data
      } ($self->ProvisionedThroughput))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Backfilling}) {
      $res{Backfilling} = (map {
            $_ ? \1 : \0
      } ($self->Backfilling))[0];
    }
    if (exists $self->{IndexArn}) {
      $res{IndexArn} = (map {
            "$_"
      } ($self->IndexArn))[0];
    }
    if (exists $self->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($self->IndexName))[0];
    }
    if (exists $self->{IndexSizeBytes}) {
      $res{IndexSizeBytes} = (map {
            int($_)
      } ($self->IndexSizeBytes))[0];
    }
    if (exists $self->{IndexStatus}) {
      $res{IndexStatus} = (map {
            "$_"
      } ($self->IndexStatus))[0];
    }
    if (exists $self->{ItemCount}) {
      $res{ItemCount} = (map {
            int($_)
      } ($self->ItemCount))[0];
    }
    if (exists $self->{KeySchema}) {
      $res{KeySchema} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->KeySchema))[0];
    }
    if (exists $self->{Projection}) {
      $res{Projection} = (map {
            $_->to_json_data
      } ($self->Projection))[0];
    }
    if (exists $self->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            $_->to_json_data
      } ($self->ProvisionedThroughput))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Backfilling}) {
      my $key = "${prefix}Backfilling";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->Backfilling;
    }

    if (exists $self->{IndexArn}) {
      my $key = "${prefix}IndexArn";
      do {
            $res->{$key} = "$_";
      } for $self->IndexArn;
    }

    if (exists $self->{IndexName}) {
      my $key = "${prefix}IndexName";
      do {
            $res->{$key} = "$_";
      } for $self->IndexName;
    }

    if (exists $self->{IndexSizeBytes}) {
      my $key = "${prefix}IndexSizeBytes";
      do {
            $res->{$key} = int($_);
      } for $self->IndexSizeBytes;
    }

    if (exists $self->{IndexStatus}) {
      my $key = "${prefix}IndexStatus";
      do {
            $res->{$key} = "$_";
      } for $self->IndexStatus;
    }

    if (exists $self->{ItemCount}) {
      my $key = "${prefix}ItemCount";
      do {
            $res->{$key} = int($_);
      } for $self->ItemCount;
    }

    if (exists $self->{KeySchema}) {
      my $key = "${prefix}KeySchema";
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
      } for $self->KeySchema;
    }

    if (exists $self->{Projection}) {
      my $key = "${prefix}Projection";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Projection;
    }

    if (exists $self->{ProvisionedThroughput}) {
      my $key = "${prefix}ProvisionedThroughput";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ProvisionedThroughput;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::GlobalSecondaryIndexDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::GlobalSecondaryIndexDescription object:

  $service_obj->Method(Att1 => { Backfilling => $value, ..., ProvisionedThroughput => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::GlobalSecondaryIndexDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->Backfilling

=head1 DESCRIPTION

Represents the properties of a global secondary index.

=head1 ATTRIBUTES


=head2 Backfilling => Bool

  Indicates whether the index is currently backfilling. I<Backfilling> is
the process of reading items from the table and determining whether
they can be added to the index. (Not all items will qualify: For
example, a partition key cannot have any duplicate values.) If an item
can be added to the index, DynamoDB will do so. After all items have
been processed, the backfilling operation is complete and
C<Backfilling> is false.

For indexes that were created during a C<CreateTable> operation, the
C<Backfilling> attribute does not appear in the C<DescribeTable>
output.


=head2 IndexArn => Str

  The Amazon Resource Name (ARN) that uniquely identifies the index.


=head2 IndexName => Str

  The name of the global secondary index.


=head2 IndexSizeBytes => Int

  The total size of the specified index, in bytes. DynamoDB updates this
value approximately every six hours. Recent changes might not be
reflected in this value.


=head2 IndexStatus => Str

  The current state of the global secondary index:

=over

=item *

C<CREATING> - The index is being created.

=item *

C<UPDATING> - The index is being updated.

=item *

C<DELETING> - The index is being deleted.

=item *

C<ACTIVE> - The index is ready for use.

=back



=head2 ItemCount => Int

  The number of items in the specified index. DynamoDB updates this value
approximately every six hours. Recent changes might not be reflected in
this value.


=head2 KeySchema => ArrayRef[L<Paws::DynamoDB::KeySchemaElement>]

  The complete key schema for a global secondary index, which consists of
one or more pairs of attribute names and key types:

=over

=item *

C<HASH> - partition key

=item *

C<RANGE> - sort key

=back

The partition key of an item is also known as its I<hash attribute>.
The term "hash attribute" derives from DynamoDB' usage of an internal
hash function to evenly distribute data items across partitions, based
on their partition key values.

The sort key of an item is also known as its I<range attribute>. The
term "range attribute" derives from the way DynamoDB stores items with
the same partition key physically close together, in sorted order by
the sort key value.


=head2 Projection => L<Paws::DynamoDB::Projection>

  Represents attributes that are copied (projected) from the table into
the global secondary index. These are in addition to the primary key
attributes and index key attributes, which are automatically projected.


=head2 ProvisionedThroughput => L<Paws::DynamoDB::ProvisionedThroughputDescription>

  Represents the provisioned throughput settings for the specified global
secondary index.

For current minimum and maximum provisioned throughput values, see
Limits
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
in the I<Amazon DynamoDB Developer Guide>.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
