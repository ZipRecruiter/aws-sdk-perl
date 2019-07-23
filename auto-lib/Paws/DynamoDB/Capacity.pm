package Paws::DynamoDB::Capacity;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has CapacityUnits => (is => 'ro', isa => Num);
  has ReadCapacityUnits => (is => 'ro', isa => Num);
  has WriteCapacityUnits => (is => 'ro', isa => Num);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{CapacityUnits}) {
      $res{CapacityUnits} = (map {
            0 + $_
      } ($args->{CapacityUnits}))[0];
    }
    if (exists $args->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            0 + $_
      } ($args->{ReadCapacityUnits}))[0];
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
      } elsif ($nodeName eq "ReadCapacityUnits") {
        my $key = "ReadCapacityUnits";
            $res->{$key} = 0 + ( $_->nodeValue // 0 );
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
    if (exists $self->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            0 + $_
      } ($self->ReadCapacityUnits))[0];
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
    if (exists $self->{ReadCapacityUnits}) {
      $res{ReadCapacityUnits} = (map {
            0 + $_
      } ($self->ReadCapacityUnits))[0];
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

    if (exists $self->{ReadCapacityUnits}) {
      my $key = "${prefix}ReadCapacityUnits";
      do {
            $res->{$key} = 0 + $_;
      } for $self->ReadCapacityUnits;
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

Paws::DynamoDB::Capacity

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::Capacity object:

  $service_obj->Method(Att1 => { CapacityUnits => $value, ..., WriteCapacityUnits => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::Capacity object:

  $result = $service_obj->Method(...);
  $result->Att1->CapacityUnits

=head1 DESCRIPTION

Represents the amount of provisioned throughput capacity consumed on a
table or an index.

=head1 ATTRIBUTES


=head2 CapacityUnits => Num

  The total number of capacity units consumed on a table or an index.


=head2 ReadCapacityUnits => Num

  The total number of read capacity units consumed on a table or an
index.


=head2 WriteCapacityUnits => Num

  The total number of write capacity units consumed on a table or an
index.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
