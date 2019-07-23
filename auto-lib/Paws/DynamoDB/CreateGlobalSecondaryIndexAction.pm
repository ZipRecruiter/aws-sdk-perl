package Paws::DynamoDB::CreateGlobalSecondaryIndexAction;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has IndexName => (is => 'ro', isa => Str, required => 1);
  has KeySchema => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::KeySchemaElement']], required => 1);
  has Projection => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::Projection'], required => 1);
  has ProvisionedThroughput => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ProvisionedThroughput']);

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
    if (exists $args->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            ref($_) eq 'Paws::DynamoDB::ProvisionedThroughput' ? $_ : do {
              require Paws::DynamoDB::ProvisionedThroughput;
              Paws::DynamoDB::ProvisionedThroughput->new_with_coercions($_);
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
      } elsif ($nodeName eq "ProvisionedThroughput") {
        my $key = "ProvisionedThroughput";
            $res->{$key} = do {
              require Paws::DynamoDB::ProvisionedThroughput;
              Paws::DynamoDB::ProvisionedThroughput->new_from_xml($_);
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

Paws::DynamoDB::CreateGlobalSecondaryIndexAction

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::CreateGlobalSecondaryIndexAction object:

  $service_obj->Method(Att1 => { IndexName => $value, ..., ProvisionedThroughput => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::CreateGlobalSecondaryIndexAction object:

  $result = $service_obj->Method(...);
  $result->Att1->IndexName

=head1 DESCRIPTION

Represents a new global secondary index to be added to an existing
table.

=head1 ATTRIBUTES


=head2 B<REQUIRED> IndexName => Str

  The name of the global secondary index to be created.


=head2 B<REQUIRED> KeySchema => ArrayRef[L<Paws::DynamoDB::KeySchemaElement>]

  The key schema for the global secondary index.


=head2 B<REQUIRED> Projection => L<Paws::DynamoDB::Projection>

  Represents attributes that are copied (projected) from the table into
an index. These are in addition to the primary key attributes and index
key attributes, which are automatically projected.


=head2 ProvisionedThroughput => L<Paws::DynamoDB::ProvisionedThroughput>

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
