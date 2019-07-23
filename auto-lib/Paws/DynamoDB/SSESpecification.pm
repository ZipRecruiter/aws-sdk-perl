package Paws::DynamoDB::SSESpecification;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has Enabled => (is => 'ro', isa => Bool);
  has KMSMasterKeyId => (is => 'ro', isa => Str);
  has SSEType => (is => 'ro', isa => Str);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{Enabled}) {
      $res{Enabled} = (map {
            0 + !!$_
      } ($args->{Enabled}))[0];
    }
    if (exists $args->{KMSMasterKeyId}) {
      $res{KMSMasterKeyId} = (map {
            "$_"
      } ($args->{KMSMasterKeyId}))[0];
    }
    if (exists $args->{SSEType}) {
      $res{SSEType} = (map {
            "$_"
      } ($args->{SSEType}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "Enabled") {
        my $key = "Enabled";
            $res->{$key} =
              do { my $d = $_->nodeValue // ''; $d eq "true" || $d eq "1" };
      } elsif ($nodeName eq "KMSMasterKeyId") {
        my $key = "KMSMasterKeyId";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "SSEType") {
        my $key = "SSEType";
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
    if (exists $self->{Enabled}) {
      $res{Enabled} = (map {
            0 + !!$_
      } ($self->Enabled))[0];
    }
    if (exists $self->{KMSMasterKeyId}) {
      $res{KMSMasterKeyId} = (map {
            "$_"
      } ($self->KMSMasterKeyId))[0];
    }
    if (exists $self->{SSEType}) {
      $res{SSEType} = (map {
            "$_"
      } ($self->SSEType))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{Enabled}) {
      $res{Enabled} = (map {
            $_ ? \1 : \0
      } ($self->Enabled))[0];
    }
    if (exists $self->{KMSMasterKeyId}) {
      $res{KMSMasterKeyId} = (map {
            "$_"
      } ($self->KMSMasterKeyId))[0];
    }
    if (exists $self->{SSEType}) {
      $res{SSEType} = (map {
            "$_"
      } ($self->SSEType))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{Enabled}) {
      my $key = "${prefix}Enabled";
      do {
            $res->{$key} = $_ ? "true" : "false";
      } for $self->Enabled;
    }

    if (exists $self->{KMSMasterKeyId}) {
      my $key = "${prefix}KMSMasterKeyId";
      do {
            $res->{$key} = "$_";
      } for $self->KMSMasterKeyId;
    }

    if (exists $self->{SSEType}) {
      my $key = "${prefix}SSEType";
      do {
            $res->{$key} = "$_";
      } for $self->SSEType;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::SSESpecification

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::SSESpecification object:

  $service_obj->Method(Att1 => { Enabled => $value, ..., SSEType => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::SSESpecification object:

  $result = $service_obj->Method(...);
  $result->Att1->Enabled

=head1 DESCRIPTION

Represents the settings used to enable server-side encryption.

=head1 ATTRIBUTES


=head2 Enabled => Bool

  Indicates whether server-side encryption is enabled (true) or disabled
(false) on the table. If enabled (true), server-side encryption type is
set to C<KMS>. If disabled (false) or not specified, server-side
encryption is set to AWS owned CMK.


=head2 KMSMasterKeyId => Str

  The KMS Master Key (CMK) which should be used for the KMS encryption.
To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias
name, or alias ARN. Note that you should only provide this parameter if
the key is different from the default DynamoDB KMS Master Key
alias/aws/dynamodb.


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




=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
