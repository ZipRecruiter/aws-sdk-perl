package Paws::DynamoDB::LocalSecondaryIndex;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has IndexName => (is => 'ro', isa => Str, required => 1);
  has KeySchema => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::KeySchemaElement']], required => 1);
  has Projection => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Projection'], required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($args->{IndexName}))[0];
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

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "IndexName") {
        my $key = "IndexName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
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

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($self->IndexName))[0];
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

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{IndexName}) {
      $res{IndexName} = (map {
            "$_"
      } ($self->IndexName))[0];
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

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{IndexName}) {
      my $key = "${prefix}IndexName";
      do {
            $res->{$key} = "$_";
      } for $self->IndexName;
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

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::LocalSecondaryIndex

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::LocalSecondaryIndex object:

  $service_obj->Method(Att1 => { IndexName => $value, ..., Projection => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::LocalSecondaryIndex object:

  $result = $service_obj->Method(...);
  $result->Att1->IndexName

=head1 DESCRIPTION

Represents the properties of a local secondary index.

=head1 ATTRIBUTES


=head2 B<REQUIRED> IndexName => Str

  The name of the local secondary index. The name must be unique among
all other indexes on this table.


=head2 B<REQUIRED> KeySchema => ArrayRef[L<Paws::DynamoDB::KeySchemaElement>]

  The complete key schema for the local secondary index, consisting of
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


=head2 B<REQUIRED> Projection => L<Paws::DynamoDB::Projection>

  Represents attributes that are copied (projected) from the table into
the local secondary index. These are in addition to the primary key
attributes and index key attributes, which are automatically projected.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
