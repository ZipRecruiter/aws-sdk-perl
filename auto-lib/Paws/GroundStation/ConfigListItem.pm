package Paws::GroundStation::ConfigListItem;
  use Moose;
  has ConfigArn => (is => 'ro', isa => 'Str', request_name => 'configArn', traits => ['NameInRequest']);
  has ConfigId => (is => 'ro', isa => 'Str', request_name => 'configId', traits => ['NameInRequest']);
  has ConfigType => (is => 'ro', isa => 'Str', request_name => 'configType', traits => ['NameInRequest']);
  has Name => (is => 'ro', isa => 'Str', request_name => 'name', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::GroundStation::ConfigListItem

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::GroundStation::ConfigListItem object:

  $service_obj->Method(Att1 => { ConfigArn => $value, ..., Name => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::GroundStation::ConfigListItem object:

  $result = $service_obj->Method(...);
  $result->Att1->ConfigArn

=head1 DESCRIPTION

An item in a list of C<Config> objects.

=head1 ATTRIBUTES


=head2 ConfigArn => Str

  ARN of a C<Config>.


=head2 ConfigId => Str

  UUID of a C<Config>.


=head2 ConfigType => Str

  Type of a C<Config>.


=head2 Name => Str

  Name of a C<Config>.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::GroundStation>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

