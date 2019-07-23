
package Paws::DynamoDB::ListTagsOfResourceOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has NextToken => (is => 'ro', isa => Str);
  has Tags => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::Tag']]);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{NextToken}) {
      $res{NextToken} = (map {
            "$_"
      } ($args->{NextToken}))[0];
    }
    if (exists $args->{Tags}) {
      $res{Tags} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::Tag' ? $_ : do {
                  require Paws::DynamoDB::Tag;
                  Paws::DynamoDB::Tag->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{Tags}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "NextToken") {
        my $key = "NextToken";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "Tags") {
        my $key = "Tags";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::Tag;
                Paws::DynamoDB::Tag->new_from_xml($_);
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
    if (exists $self->{NextToken}) {
      $res{NextToken} = (map {
            "$_"
      } ($self->NextToken))[0];
    }
    if (exists $self->{Tags}) {
      $res{Tags} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->Tags))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{NextToken}) {
      $res{NextToken} = (map {
            "$_"
      } ($self->NextToken))[0];
    }
    if (exists $self->{Tags}) {
      $res{Tags} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->Tags))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{NextToken}) {
      my $key = "${prefix}NextToken";
      do {
            $res->{$key} = "$_";
      } for $self->NextToken;
    }

    if (exists $self->{Tags}) {
      my $key = "${prefix}Tags";
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
      } for $self->Tags;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListTagsOfResourceOutput

=head1 ATTRIBUTES


=head2 NextToken => Str

If this value is returned, there are additional results to be
displayed. To retrieve them, call ListTagsOfResource again, with
NextToken set to this value.


=head2 Tags => ArrayRef[L<Paws::DynamoDB::Tag>]

The tags currently associated with the Amazon DynamoDB resource.


=head2 _request_id => Str


=cut

