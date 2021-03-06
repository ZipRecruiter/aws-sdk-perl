
package Paws::SecurityHub::EnableSecurityHub;
  use Moose;
  has Tags => (is => 'ro', isa => 'Paws::SecurityHub::TagMap');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'EnableSecurityHub');
  class_has _api_uri  => (isa => 'Str', is => 'ro', default => '/accounts');
  class_has _api_method  => (isa => 'Str', is => 'ro', default => 'POST');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::SecurityHub::EnableSecurityHubResponse');
1;

### main pod documentation begin ###

=head1 NAME

Paws::SecurityHub::EnableSecurityHub - Arguments for method EnableSecurityHub on L<Paws::SecurityHub>

=head1 DESCRIPTION

This class represents the parameters used for calling the method EnableSecurityHub on the
L<AWS SecurityHub|Paws::SecurityHub> service. Use the attributes of this class
as arguments to method EnableSecurityHub.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to EnableSecurityHub.

=head1 SYNOPSIS

    my $securityhub = Paws->service('SecurityHub');
    my $EnableSecurityHubResponse = $securityhub->EnableSecurityHub(
      Tags => {
        'MyTagKey' => 'MyTagValue',    # key: min: 1, max: 128, value: max: 256
      },    # OPTIONAL
    );

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/securityhub/EnableSecurityHub>

=head1 ATTRIBUTES


=head2 Tags => L<Paws::SecurityHub::TagMap>

The tags to add to the Hub resource when you enable Security Hub.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method EnableSecurityHub in L<Paws::SecurityHub>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

