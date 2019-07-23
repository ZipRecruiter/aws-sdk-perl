
package Paws::DynamoDB::UntagResource;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has ResourceArn => (is => 'ro', isa => Str, required => 1);
  has TagKeys => (is => 'ro', isa => ArrayRef[Maybe[Str]], required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UntagResource');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::API::Response');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($args->{ResourceArn}))[0];
    }
    if (exists $args->{TagKeys}) {
      $res{TagKeys} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($args->{TagKeys}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ResourceArn") {
        my $key = "ResourceArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TagKeys") {
        my $key = "TagKeys";
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
    if (exists $self->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($self->ResourceArn))[0];
    }
    if (exists $self->{TagKeys}) {
      $res{TagKeys} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->TagKeys))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($self->ResourceArn))[0];
    }
    if (exists $self->{TagKeys}) {
      $res{TagKeys} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->TagKeys))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ResourceArn}) {
      my $key = "${prefix}ResourceArn";
      do {
            $res->{$key} = "$_";
      } for $self->ResourceArn;
    }

    if (exists $self->{TagKeys}) {
      my $key = "${prefix}TagKeys";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              $res->{$key} = defined($val) ? "$val" : undef;
            }
      } for $self->TagKeys;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::UntagResource - Arguments for method UntagResource on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method UntagResource on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method UntagResource.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to UntagResource.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    $dynamodb->UntagResource(
      ResourceArn => 'MyResourceArnString',
      TagKeys     => [
        'MyTagKeyString', ...    # min: 1, max: 128
      ],

    );

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/UntagResource>

=head1 ATTRIBUTES


=head2 B<REQUIRED> ResourceArn => Str

The Amazon DyanamoDB resource the tags will be removed from. This value
is an Amazon Resource Name (ARN).



=head2 B<REQUIRED> TagKeys => ArrayRef[Maybe[Str]]

A list of tag keys. Existing tags of the resource whose keys are
members of this list will be removed from the Amazon DynamoDB resource.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method UntagResource in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

