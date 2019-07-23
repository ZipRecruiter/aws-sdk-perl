
package Paws::DynamoDB::ListTagsOfResource;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has NextToken => (is => 'ro', isa => Str);
  has ResourceArn => (is => 'ro', isa => Str, required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListTagsOfResource');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::ListTagsOfResourceOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{NextToken}) {
      $res{NextToken} = (map {
            "$_"
      } ($args->{NextToken}))[0];
    }
    if (exists $args->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($args->{ResourceArn}))[0];
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
      } elsif ($nodeName eq "ResourceArn") {
        my $key = "ResourceArn";
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
    if (exists $self->{NextToken}) {
      $res{NextToken} = (map {
            "$_"
      } ($self->NextToken))[0];
    }
    if (exists $self->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($self->ResourceArn))[0];
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
    if (exists $self->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($self->ResourceArn))[0];
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

    if (exists $self->{ResourceArn}) {
      my $key = "${prefix}ResourceArn";
      do {
            $res->{$key} = "$_";
      } for $self->ResourceArn;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListTagsOfResource - Arguments for method ListTagsOfResource on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListTagsOfResource on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method ListTagsOfResource.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ListTagsOfResource.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $ListTagsOfResourceOutput = $dynamodb->ListTagsOfResource(
      ResourceArn => 'MyResourceArnString',
      NextToken   => 'MyNextTokenString',     # OPTIONAL
    );

    # Results:
    my $NextToken = $ListTagsOfResourceOutput->NextToken;
    my $Tags      = $ListTagsOfResourceOutput->Tags;

    # Returns a L<Paws::DynamoDB::ListTagsOfResourceOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/ListTagsOfResource>

=head1 ATTRIBUTES


=head2 NextToken => Str

An optional string that, if supplied, must be copied from the output of
a previous call to ListTagOfResource. When provided in this manner,
this API fetches the next page of results.



=head2 B<REQUIRED> ResourceArn => Str

The Amazon DynamoDB resource with tags to be listed. This value is an
Amazon Resource Name (ARN).




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ListTagsOfResource in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

