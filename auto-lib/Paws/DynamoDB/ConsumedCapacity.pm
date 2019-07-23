package Paws::DynamoDB::ConsumedCapacity;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has CapacityUnits => (is => 'ro', isa => Num);
  has GlobalSecondaryIndexes => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::SecondaryIndexesCapacityMap']);
  has LocalSecondaryIndexes => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::SecondaryIndexesCapacityMap']);
  has ReadCapacityUnits => (is => 'ro', isa => Num);
  has Table => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Capacity']);
  has TableName => (is => 'ro', isa => Str);
  has WriteCapacityUnits => (is => 'ro', isa => Num);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{CapacityUnits}) {
      $res{CapacityUnits} = (map {
            0 + $_
      } ($args->{CapacityUnits}))[0];
    }
    if (exists $args->{GlobalSecondaryIndexes}) {
      $res{GlobalSecondaryIndexes} = (map {
            ref($_) eq 'Paws::DynamoDB::SecondaryIndexesCapacityMap' ? $_ : do {
              require Paws::DynamoDB::SecondaryIndexesCapacityMap;
              Paws::DynamoDB::SecondaryIndexesCapacityMap->new_with_coercions($_);
              }
      } ($args->{GlobalSecondaryIndexes}))[0];
    }
    if (exists $args->{LocalSecondaryIndexes}) {
      $res{LocalSecondaryIndexes} = (map {
            ref($_) eq 'Paws::DynamoDB::SecondaryIndexesCapacityMap' ? $_ : do {
              require Paws::DynamoDB::SecondaryIndexesCapacityMap;
              Paws::DynamoDB::SecondaryIndexesCapacityMap->new_with_coercions($_);
              }
      } ($args->{LocalSecondaryIndexes}))[0];
    }
    if (exists $args->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            0 + $_
      } ($args->{ReadCapacityUnits}))[0];
    }
    if (exists $args->{Table}) {
      $res{Table} = (map {
            ref($_) eq 'Paws::DynamoDB::Capacity' ? $_ : do {
              require Paws::DynamoDB::Capacity;
              Paws::DynamoDB::Capacity->new_with_coercions($_);
              }
      } ($args->{Table}))[0];
    }
    if (exists $args->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($args->{TableName}))[0];
    }
    if (exists $args->{WriteCapacityUnits}) {
      $res{WriteCapacityUnits} = (map {
            0 + $_
      } ($args->{WriteCapacityUnits}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "CapacityUnits") {
        my $key = "CapacityUnits";
            $res->{$key} = 0 + ( $_->nodeValue // 0 );
      } elsif ($nodeName eq "GlobalSecondaryIndexes") {
        my $key = "GlobalSecondaryIndexes";
            do {
              require Paws::DynamoDB::SecondaryIndexesCapacityMap;
              Paws::DynamoDB::SecondaryIndexesCapacityMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "LocalSecondaryIndexes") {
        my $key = "LocalSecondaryIndexes";
            do {
              require Paws::DynamoDB::SecondaryIndexesCapacityMap;
              Paws::DynamoDB::SecondaryIndexesCapacityMap->read_xml( $_, $res, $key );
            };
      } elsif ($nodeName eq "ReadCapacityUnits") {
        my $key = "ReadCapacityUnits";
            $res->{$key} = 0 + ( $_->nodeValue // 0 );
      } elsif ($nodeName eq "Table") {
        my $key = "Table";
            $res->{$key} = do {
              require Paws::DynamoDB::Capacity;
              Paws::DynamoDB::Capacity->new_from_xml($_);
            };
      } elsif ($nodeName eq "TableName") {
        my $key = "TableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "WriteCapacityUnits") {
        my $key = "WriteCapacityUnits";
            $res->{$key} = 0 + ( $_->nodeValue // 0 );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{CapacityUnits}) {
      $res{CapacityUnits} = (map {
            0 + $_
      } ($self->CapacityUnits))[0];
    }
    if (exists $self->{GlobalSecondaryIndexes}) {
      $res{GlobalSecondaryIndexes} = (map {
            $_->to_hash_data
      } ($self->GlobalSecondaryIndexes))[0];
    }
    if (exists $self->{LocalSecondaryIndexes}) {
      $res{LocalSecondaryIndexes} = (map {
            $_->to_hash_data
      } ($self->LocalSecondaryIndexes))[0];
    }
    if (exists $self->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            0 + $_
      } ($self->ReadCapacityUnits))[0];
    }
    if (exists $self->{Table}) {
      $res{Table} = (map {
            $_->to_hash_data
      } ($self->Table))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{WriteCapacityUnits}) {
      $res{WriteCapacityUnits} = (map {
            0 + $_
      } ($self->WriteCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{CapacityUnits}) {
      $res{CapacityUnits} = (map {
            0 + $_
      } ($self->CapacityUnits))[0];
    }
    if (exists $self->{GlobalSecondaryIndexes}) {
      $res{GlobalSecondaryIndexes} = (map {
            $_->to_json_data
      } ($self->GlobalSecondaryIndexes))[0];
    }
    if (exists $self->{LocalSecondaryIndexes}) {
      $res{LocalSecondaryIndexes} = (map {
            $_->to_json_data
      } ($self->LocalSecondaryIndexes))[0];
    }
    if (exists $self->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            0 + $_
      } ($self->ReadCapacityUnits))[0];
    }
    if (exists $self->{Table}) {
      $res{Table} = (map {
            $_->to_json_data
      } ($self->Table))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{WriteCapacityUnits}) {
      $res{WriteCapacityUnits} = (map {
            0 + $_
      } ($self->WriteCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{CapacityUnits}) {
      my $key = "${prefix}CapacityUnits";
      do {
            $res->{$key} = 0 + $_;
      } for $self->CapacityUnits;
    }

    if (exists $self->{GlobalSecondaryIndexes}) {
      my $key = "${prefix}GlobalSecondaryIndexes";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->GlobalSecondaryIndexes;
    }

    if (exists $self->{LocalSecondaryIndexes}) {
      my $key = "${prefix}LocalSecondaryIndexes";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->LocalSecondaryIndexes;
    }

    if (exists $self->{ReadCapacityUnits}) {
      my $key = "${prefix}ReadCapacityUnits";
      do {
            $res->{$key} = 0 + $_;
      } for $self->ReadCapacityUnits;
    }

    if (exists $self->{Table}) {
      my $key = "${prefix}Table";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->Table;
    }

    if (exists $self->{TableName}) {
      my $key = "${prefix}TableName";
      do {
            $res->{$key} = "$_";
      } for $self->TableName;
    }

    if (exists $self->{WriteCapacityUnits}) {
      my $key = "${prefix}WriteCapacityUnits";
      do {
            $res->{$key} = 0 + $_;
      } for $self->WriteCapacityUnits;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ConsumedCapacity

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ConsumedCapacity object:

  $service_obj->Method(Att1 => { CapacityUnits => $value, ..., WriteCapacityUnits => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ConsumedCapacity object:

  $result = $service_obj->Method(...);
  $result->Att1->CapacityUnits

=head1 DESCRIPTION

The capacity units consumed by an operation. The data returned includes
the total provisioned throughput consumed, along with statistics for
the table and any indexes involved in the operation.
C<ConsumedCapacity> is only returned if the request asked for it. For
more information, see Provisioned Throughput
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
in the I<Amazon DynamoDB Developer Guide>.

=head1 ATTRIBUTES


=head2 CapacityUnits => Num

  The total number of capacity units consumed by the operation.


=head2 GlobalSecondaryIndexes => L<Paws::DynamoDB::SecondaryIndexesCapacityMap>

  The amount of throughput consumed on each global index affected by the
operation.


=head2 LocalSecondaryIndexes => L<Paws::DynamoDB::SecondaryIndexesCapacityMap>

  The amount of throughput consumed on each local index affected by the
operation.


=head2 ReadCapacityUnits => Num

  The total number of read capacity units consumed by the operation.


=head2 Table => L<Paws::DynamoDB::Capacity>

  The amount of throughput consumed on the table affected by the
operation.


=head2 TableName => Str

  The name of the table that was affected by the operation.


=head2 WriteCapacityUnits => Num

  The total number of write capacity units consumed by the operation.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
