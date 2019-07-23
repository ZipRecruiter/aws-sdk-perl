package Paws::DynamoDB::ProvisionedThroughput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has ReadCapacityUnits => (is => 'ro', isa => Int, required => 1);
  has WriteCapacityUnits => (is => 'ro', isa => Int, required => 1);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            int($_)
      } ($args->{ReadCapacityUnits}))[0];
    }
    if (exists $args->{WriteCapacityUnits}) {
      $res{WriteCapacityUnits} = (map {
            int($_)
      } ($args->{WriteCapacityUnits}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ReadCapacityUnits") {
        my $key = "ReadCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "WriteCapacityUnits") {
        my $key = "WriteCapacityUnits";
            $res->{$key} = int( $_->nodeValue // 0 );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            int($_)
      } ($self->ReadCapacityUnits))[0];
    }
    if (exists $self->{WriteCapacityUnits}) {
      $res{WriteCapacityUnits} = (map {
            int($_)
      } ($self->WriteCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            int($_)
      } ($self->ReadCapacityUnits))[0];
    }
    if (exists $self->{WriteCapacityUnits}) {
      $res{WriteCapacityUnits} = (map {
            int($_)
      } ($self->WriteCapacityUnits))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ReadCapacityUnits}) {
      my $key = "${prefix}ReadCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->ReadCapacityUnits;
    }

    if (exists $self->{WriteCapacityUnits}) {
      my $key = "${prefix}WriteCapacityUnits";
      do {
            $res->{$key} = int($_);
      } for $self->WriteCapacityUnits;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ProvisionedThroughput

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ProvisionedThroughput object:

  $service_obj->Method(Att1 => { ReadCapacityUnits => $value, ..., WriteCapacityUnits => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ProvisionedThroughput object:

  $result = $service_obj->Method(...);
  $result->Att1->ReadCapacityUnits

=head1 DESCRIPTION

Represents the provisioned throughput settings for a specified table or
index. The settings can be modified using the C<UpdateTable> operation.

For current minimum and maximum provisioned throughput values, see
Limits
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
in the I<Amazon DynamoDB Developer Guide>.

=head1 ATTRIBUTES


=head2 B<REQUIRED> ReadCapacityUnits => Int

  The maximum number of strongly consistent reads consumed per second
before DynamoDB returns a C<ThrottlingException>. For more information,
see Specifying Read and Write Requirements
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
in the I<Amazon DynamoDB Developer Guide>.

If read/write capacity mode is C<PAY_PER_REQUEST> the value is set to
0.


=head2 B<REQUIRED> WriteCapacityUnits => Int

  The maximum number of writes consumed per second before DynamoDB
returns a C<ThrottlingException>. For more information, see Specifying
Read and Write Requirements
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
in the I<Amazon DynamoDB Developer Guide>.

If read/write capacity mode is C<PAY_PER_REQUEST> the value is set to
0.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
