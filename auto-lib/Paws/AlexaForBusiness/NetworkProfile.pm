package Paws::AlexaForBusiness::NetworkProfile;
  use Moose;
  has CertificateAuthorityArn => (is => 'ro', isa => 'Str');
  has CurrentPassword => (is => 'ro', isa => 'Str');
  has Description => (is => 'ro', isa => 'Str');
  has EapMethod => (is => 'ro', isa => 'Str');
  has NetworkProfileArn => (is => 'ro', isa => 'Str');
  has NetworkProfileName => (is => 'ro', isa => 'Str');
  has NextPassword => (is => 'ro', isa => 'Str');
  has SecurityType => (is => 'ro', isa => 'Str');
  has Ssid => (is => 'ro', isa => 'Str');
  has TrustAnchors => (is => 'ro', isa => 'ArrayRef[Str|Undef]');
1;

### main pod documentation begin ###

=head1 NAME

Paws::AlexaForBusiness::NetworkProfile

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::AlexaForBusiness::NetworkProfile object:

  $service_obj->Method(Att1 => { CertificateAuthorityArn => $value, ..., TrustAnchors => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::AlexaForBusiness::NetworkProfile object:

  $result = $service_obj->Method(...);
  $result->Att1->CertificateAuthorityArn

=head1 DESCRIPTION

The network profile associated with a device.

=head1 ATTRIBUTES


=head2 CertificateAuthorityArn => Str

  The ARN of the Private Certificate Authority (PCA) created in AWS
Certificate Manager (ACM). This is used to issue certificates to the
devices.


=head2 CurrentPassword => Str

  The current password of the Wi-Fi network.


=head2 Description => Str

  Detailed information about a device's network profile.


=head2 EapMethod => Str

  The authentication standard that is used in the EAP framework.
Currently, EAP_TLS is supported.


=head2 NetworkProfileArn => Str

  The ARN of the network profile associated with a device.


=head2 NetworkProfileName => Str

  The name of the network profile associated with a device.


=head2 NextPassword => Str

  The next, or subsequent, password of the Wi-Fi network. This password
is asynchronously transmitted to the device and is used when the
password of the network changes to NextPassword.


=head2 SecurityType => Str

  The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
WPA2_PSK, WPA_PSK, WEP, or OPEN.


=head2 Ssid => Str

  The SSID of the Wi-Fi network.


=head2 TrustAnchors => ArrayRef[Str|Undef]

  The root certificates of your authentication server, which is installed
on your devices and used to trust your authentication server during EAP
negotiation.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::AlexaForBusiness>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

