package Paws::DynamoDB::Projection;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has NonKeyAttributes => (is => 'ro', isa => ArrayRef[Maybe[Str]]);
  has ProjectionType => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{NonKeyAttributes}) {
      $res{NonKeyAttributes} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($args->{NonKeyAttributes}))[0];
    }
    if (exists $args->{ProjectionType}) {
      $res{ProjectionType} = (map {
            "$_"
      } ($args->{ProjectionType}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "NonKeyAttributes") {
        my $key = "NonKeyAttributes";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ProjectionType") {
        my $key = "ProjectionType";
            $res->{$key} = "" . ( $_->nodeValue // '' );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{NonKeyAttributes}) {
      $res{NonKeyAttributes} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->NonKeyAttributes))[0];
    }
    if (exists $self->{ProjectionType}) {
      $res{ProjectionType} = (map {
            "$_"
      } ($self->ProjectionType))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{NonKeyAttributes}) {
      $res{NonKeyAttributes} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->NonKeyAttributes))[0];
    }
    if (exists $self->{ProjectionType}) {
      $res{ProjectionType} = (map {
            "$_"
      } ($self->ProjectionType))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{NonKeyAttributes}) {
      my $key = "${prefix}NonKeyAttributes";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              $res->{$key} = defined($val) ? "$val" : undef;
            }
      } for $self->NonKeyAttributes;
    }

    if (exists $self->{ProjectionType}) {
      my $key = "${prefix}ProjectionType";
      do {
            $res->{$key} = "$_";
      } for $self->ProjectionType;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::Projection

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::Projection object:

  $service_obj->Method(Att1 => { NonKeyAttributes => $value, ..., ProjectionType => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::Projection object:

  $result = $service_obj->Method(...);
  $result->Att1->NonKeyAttributes

=head1 DESCRIPTION

Represents attributes that are copied (projected) from the table into
an index. These are in addition to the primary key attributes and index
key attributes, which are automatically projected.

=head1 ATTRIBUTES


=head2 NonKeyAttributes => ArrayRef[Maybe[Str]]

  Represents the non-key attribute names which will be projected into the
index.

For local secondary indexes, the total count of C<NonKeyAttributes>
summed across all of the local secondary indexes, must not exceed 20.
If you project the same attribute into two different indexes, this
counts as two distinct attributes when determining the total.


=head2 ProjectionType => Str

  The set of attributes that are projected into the index:

=over

=item *

C<KEYS_ONLY> - Only the index and primary keys are projected into the
index.

=item *

C<INCLUDE> - Only the specified table attributes are projected into the
index. The list of projected attributes are in C<NonKeyAttributes>.

=item *

C<ALL> - All of the table attributes are projected into the index.

=back




=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
