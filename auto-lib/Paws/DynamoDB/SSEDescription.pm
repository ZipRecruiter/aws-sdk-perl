package Paws::DynamoDB::SSEDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has KMSMasterKeyArn => (is => 'ro', isa => Str);
  has SSEType => (is => 'ro', isa => Str);
  has Status => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{KMSMasterKeyArn}) {
      $res{KMSMasterKeyArn} = (map {
            "$_"
      } ($args->{KMSMasterKeyArn}))[0];
    }
    if (exists $args->{SSEType}) {
      $res{SSEType} = (map {
            "$_"
      } ($args->{SSEType}))[0];
    }
    if (exists $args->{Status}) {
      $res{Status} = (map {
            "$_"
      } ($args->{Status}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "KMSMasterKeyArn") {
        my $key = "KMSMasterKeyArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "SSEType") {
        my $key = "SSEType";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "Status") {
        my $key = "Status";
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
    if (exists $self->{KMSMasterKeyArn}) {
      $res{KMSMasterKeyArn} = (map {
            "$_"
      } ($self->KMSMasterKeyArn))[0];
    }
    if (exists $self->{SSEType}) {
      $res{SSEType} = (map {
            "$_"
      } ($self->SSEType))[0];
    }
    if (exists $self->{Status}) {
      $res{Status} = (map {
            "$_"
      } ($self->Status))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{KMSMasterKeyArn}) {
      $res{KMSMasterKeyArn} = (map {
            "$_"
      } ($self->KMSMasterKeyArn))[0];
    }
    if (exists $self->{SSEType}) {
      $res{SSEType} = (map {
            "$_"
      } ($self->SSEType))[0];
    }
    if (exists $self->{Status}) {
      $res{Status} = (map {
            "$_"
      } ($self->Status))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{KMSMasterKeyArn}) {
      my $key = "${prefix}KMSMasterKeyArn";
      do {
            $res->{$key} = "$_";
      } for $self->KMSMasterKeyArn;
    }

    if (exists $self->{SSEType}) {
      my $key = "${prefix}SSEType";
      do {
            $res->{$key} = "$_";
      } for $self->SSEType;
    }

    if (exists $self->{Status}) {
      my $key = "${prefix}Status";
      do {
            $res->{$key} = "$_";
      } for $self->Status;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::SSEDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::SSEDescription object:

  $service_obj->Method(Att1 => { KMSMasterKeyArn => $value, ..., Status => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::SSEDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->KMSMasterKeyArn

=head1 DESCRIPTION

The description of the server-side encryption status on the specified
table.

=head1 ATTRIBUTES


=head2 KMSMasterKeyArn => Str

  The KMS master key ARN used for the KMS encryption.


=head2 SSEType => Str

  Server-side encryption type:

=over

=item *

C<AES256> - Server-side encryption which uses the AES256 algorithm (not
applicable).

=item *

C<KMS> - Server-side encryption which uses AWS Key Management Service.
Key is stored in your account and is managed by AWS KMS (KMS charges
apply).

=back



=head2 Status => Str

  The current state of server-side encryption:

=over

=item *

C<ENABLING> - Server-side encryption is being enabled.

=item *

C<ENABLED> - Server-side encryption is enabled.

=item *

C<DISABLING> - Server-side encryption is being disabled.

=item *

C<DISABLED> - Server-side encryption is disabled.

=item *

C<UPDATING> - Server-side encryption is being updated.

=back




=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
