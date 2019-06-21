package Paws::MediaLive::AudioSelectorSettings;
  use Moose;
  has AudioLanguageSelection => (is => 'ro', isa => 'Paws::MediaLive::AudioLanguageSelection', request_name => 'audioLanguageSelection', traits => ['NameInRequest']);
  has AudioPidSelection => (is => 'ro', isa => 'Paws::MediaLive::AudioPidSelection', request_name => 'audioPidSelection', traits => ['NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::MediaLive::AudioSelectorSettings

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::MediaLive::AudioSelectorSettings object:

  $service_obj->Method(Att1 => { AudioLanguageSelection => $value, ..., AudioPidSelection => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::MediaLive::AudioSelectorSettings object:

  $result = $service_obj->Method(...);
  $result->Att1->AudioLanguageSelection

=head1 DESCRIPTION

Placeholder documentation for AudioSelectorSettings

=head1 ATTRIBUTES


=head2 AudioLanguageSelection => L<Paws::MediaLive::AudioLanguageSelection>

  


=head2 AudioPidSelection => L<Paws::MediaLive::AudioPidSelection>

  



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::MediaLive>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
