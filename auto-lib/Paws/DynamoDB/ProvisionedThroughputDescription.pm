package Paws::DynamoDB::ProvisionedThroughputDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has LastDecreaseDateTime => (is => 'ro', isa => Str);
  has LastIncreaseDateTime => (is => 'ro', isa => Str);
  has NumberOfDecreasesToday => (is => 'ro', isa => Int);
  has ReadCapacityUnits => (is => 'ro', isa => Int);
  has WriteCapacityUnits => (is => 'ro', isa => Int);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{LastDecreaseDateTime}) {
      $res{LastDecreaseDateTime} = (map {
            "$_"
      } ($args->{LastDecreaseDateTime}))[0];
    }
    if (exists $args->{LastIncreaseDateTime}) {
      $res{LastIncreaseDateTime} = (map {
            "$_"
      } ($args->{LastIncreaseDateTime}))[0];
    }
    if (exists $args->{NumberOfDecreasesToday}) {
      $res{NumberOfDecreasesToday} = (map {
            int($_)
      } ($args->{NumberOfDecreasesToday}))[0];
    }
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
      } elsif ($nodeName eq "LastDecreaseDateTime") {
        my $key = "LastDecreaseDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "LastIncreaseDateTime") {
        my $key = "LastIncreaseDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "NumberOfDecreasesToday") {
        my $key = "NumberOfDecreasesToday";
            $res->{$key} = int( $_->nodeValue // 0 );
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
    if (exists $self->{LastDecreaseDateTime}) {
      $res{LastDecreaseDateTime} = (map {
            "$_"
      } ($self->LastDecreaseDateTime))[0];
    }
    if (exists $self->{LastIncreaseDateTime}) {
      $res{LastIncreaseDateTime} = (map {
            "$_"
      } ($self->LastIncreaseDateTime))[0];
    }
    if (exists $self->{NumberOfDecreasesToday}) {
      $res{NumberOfDecreasesToday} = (map {
            int($_)
      } ($self->NumberOfDecreasesToday))[0];
    }
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
    if (exists $self->{LastDecreaseDateTime}) {
      $res{LastDecreaseDateTime} = (map {
            "$_"
      } ($self->LastDecreaseDateTime))[0];
    }
    if (exists $self->{LastIncreaseDateTime}) {
      $res{LastIncreaseDateTime} = (map {
            "$_"
      } ($self->LastIncreaseDateTime))[0];
    }
    if (exists $self->{NumberOfDecreasesToday}) {
      $res{NumberOfDecreasesToday} = (map {
            int($_)
      } ($self->NumberOfDecreasesToday))[0];
    }
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


    if (exists $self->{LastDecreaseDateTime}) {
      my $key = "${prefix}LastDecreaseDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->LastDecreaseDateTime;
    }

    if (exists $self->{LastIncreaseDateTime}) {
      my $key = "${prefix}LastIncreaseDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->LastIncreaseDateTime;
    }

    if (exists $self->{NumberOfDecreasesToday}) {
      my $key = "${prefix}NumberOfDecreasesToday";
      do {
            $res->{$key} = int($_);
      } for $self->NumberOfDecreasesToday;
    }

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

Paws::DynamoDB::ProvisionedThroughputDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::ProvisionedThroughputDescription object:

  $service_obj->Method(Att1 => { LastDecreaseDateTime => $value, ..., WriteCapacityUnits => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::ProvisionedThroughputDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->LastDecreaseDateTime

=head1 DESCRIPTION

Represents the provisioned throughput settings for the table,
consisting of read and write capacity units, along with data about
increases and decreases.

=head1 ATTRIBUTES


=head2 LastDecreaseDateTime => Str

  The date and time of the last provisioned throughput decrease for this
table.


=head2 LastIncreaseDateTime => Str

  The date and time of the last provisioned throughput increase for this
table.


=head2 NumberOfDecreasesToday => Int

  The number of provisioned throughput decreases for this table during
this UTC calendar day. For current maximums on provisioned throughput
decreases, see Limits
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
in the I<Amazon DynamoDB Developer Guide>.


=head2 ReadCapacityUnits => Int

  The maximum number of strongly consistent reads consumed per second
before DynamoDB returns a C<ThrottlingException>. Eventually consistent
reads require less effort than strongly consistent reads, so a setting
of 50 C<ReadCapacityUnits> per second provides 100 eventually
consistent C<ReadCapacityUnits> per second.


=head2 WriteCapacityUnits => Int

  The maximum number of writes consumed per second before DynamoDB
returns a C<ThrottlingException>.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
