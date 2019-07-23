
package Paws::DynamoDB::TagResource;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has ResourceArn => (is => 'ro', isa => Str, required => 1);
  has Tags => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::Tag']], required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'TagResource');
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
      } elsif ($nodeName eq "ResourceArn") {
        my $key = "ResourceArn";
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
    if (exists $self->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($self->ResourceArn))[0];
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
    if (exists $self->{ResourceArn}) {
      $res{ResourceArn} = (map {
            "$_"
      } ($self->ResourceArn))[0];
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


    if (exists $self->{ResourceArn}) {
      my $key = "${prefix}ResourceArn";
      do {
            $res->{$key} = "$_";
      } for $self->ResourceArn;
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

Paws::DynamoDB::TagResource - Arguments for method TagResource on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method TagResource on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method TagResource.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to TagResource.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    $dynamodb->TagResource(
      ResourceArn => 'MyResourceArnString',
      Tags        => [
        {
          Key   => 'MyTagKeyString',      # min: 1, max: 128
          Value => 'MyTagValueString',    # max: 256

        },
        ...
      ],

    );

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/TagResource>

=head1 ATTRIBUTES


=head2 B<REQUIRED> ResourceArn => Str

Identifies the Amazon DynamoDB resource to which tags should be added.
This value is an Amazon Resource Name (ARN).



=head2 B<REQUIRED> Tags => ArrayRef[L<Paws::DynamoDB::Tag>]

The tags to be assigned to the Amazon DynamoDB resource.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method TagResource in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

