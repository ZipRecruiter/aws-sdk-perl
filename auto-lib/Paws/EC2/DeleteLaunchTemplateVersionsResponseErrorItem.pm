package Paws::EC2::DeleteLaunchTemplateVersionsResponseErrorItem;
  use Moose;
  has LaunchTemplateId => (is => 'ro', isa => 'Str', request_name => 'launchTemplateId', traits => ['NameInRequest']);
  has LaunchTemplateName => (is => 'ro', isa => 'Str', request_name => 'launchTemplateName', traits => ['NameInRequest']);
  has ResponseError => (is => 'ro', isa => 'Paws::EC2::ResponseError', request_name => 'responseError', traits => ['NameInRequest']);
  has VersionNumber => (is => 'ro', isa => 'Int', request_name => 'versionNumber', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::EC2::DeleteLaunchTemplateVersionsResponseErrorItem

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::EC2::DeleteLaunchTemplateVersionsResponseErrorItem object:

  $service_obj->Method(Att1 => { LaunchTemplateId => $value, ..., VersionNumber => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::EC2::DeleteLaunchTemplateVersionsResponseErrorItem object:

  $result = $service_obj->Method(...);
  $result->Att1->LaunchTemplateId

=head1 DESCRIPTION

Describes a launch template version that could not be deleted.

=head1 ATTRIBUTES


=head2 LaunchTemplateId => Str

  The ID of the launch template.


=head2 LaunchTemplateName => Str

  The name of the launch template.


=head2 ResponseError => L<Paws::EC2::ResponseError>

  Information about the error.


=head2 VersionNumber => Int

  The version number of the launch template.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::EC2>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
