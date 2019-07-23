package Paws::DynamoDB::TimeToLiveDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has AttributeName => (is => 'ro', isa => Str);
  has TimeToLiveStatus => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{AttributeName}) {
      $res{AttributeName} = (map {
            "$_"
      } ($args->{AttributeName}))[0];
    }
    if (exists $args->{TimeToLiveStatus}) {
      $res{TimeToLiveStatus} = (map {
            "$_"
      } ($args->{TimeToLiveStatus}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "AttributeName") {
        my $key = "AttributeName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TimeToLiveStatus") {
        my $key = "TimeToLiveStatus";
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
    if (exists $self->{AttributeName}) {
      $res{AttributeName} = (map {
            "$_"
      } ($self->AttributeName))[0];
    }
    if (exists $self->{TimeToLiveStatus}) {
      $res{TimeToLiveStatus} = (map {
            "$_"
      } ($self->TimeToLiveStatus))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AttributeName}) {
      $res{AttributeName} = (map {
            "$_"
      } ($self->AttributeName))[0];
    }
    if (exists $self->{TimeToLiveStatus}) {
      $res{TimeToLiveStatus} = (map {
            "$_"
      } ($self->TimeToLiveStatus))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{AttributeName}) {
      my $key = "${prefix}AttributeName";
      do {
            $res->{$key} = "$_";
      } for $self->AttributeName;
    }

    if (exists $self->{TimeToLiveStatus}) {
      my $key = "${prefix}TimeToLiveStatus";
      do {
            $res->{$key} = "$_";
      } for $self->TimeToLiveStatus;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::TimeToLiveDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::TimeToLiveDescription object:

  $service_obj->Method(Att1 => { AttributeName => $value, ..., TimeToLiveStatus => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::TimeToLiveDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->AttributeName

=head1 DESCRIPTION

The description of the Time to Live (TTL) status on the specified
table.

=head1 ATTRIBUTES


=head2 AttributeName => Str

  The name of the Time to Live attribute for items in the table.


=head2 TimeToLiveStatus => Str

  The Time to Live status for the table.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
