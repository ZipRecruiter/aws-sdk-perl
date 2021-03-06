package Paws::Config::OrganizationCustomRuleMetadata;
  use Moose;
  has Description => (is => 'ro', isa => 'Str');
  has InputParameters => (is => 'ro', isa => 'Str');
  has LambdaFunctionArn => (is => 'ro', isa => 'Str', required => 1);
  has MaximumExecutionFrequency => (is => 'ro', isa => 'Str');
  has OrganizationConfigRuleTriggerTypes => (is => 'ro', isa => 'ArrayRef[Str|Undef]', required => 1);
  has ResourceIdScope => (is => 'ro', isa => 'Str');
  has ResourceTypesScope => (is => 'ro', isa => 'ArrayRef[Str|Undef]');
  has TagKeyScope => (is => 'ro', isa => 'Str');
  has TagValueScope => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Config::OrganizationCustomRuleMetadata

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Config::OrganizationCustomRuleMetadata object:

  $service_obj->Method(Att1 => { Description => $value, ..., TagValueScope => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Config::OrganizationCustomRuleMetadata object:

  $result = $service_obj->Method(...);
  $result->Att1->Description

=head1 DESCRIPTION

This class has no description

=head1 ATTRIBUTES


=head2 Description => Str

  


=head2 InputParameters => Str

  


=head2 B<REQUIRED> LambdaFunctionArn => Str

  


=head2 MaximumExecutionFrequency => Str

  


=head2 B<REQUIRED> OrganizationConfigRuleTriggerTypes => ArrayRef[Str|Undef]

  


=head2 ResourceIdScope => Str

  


=head2 ResourceTypesScope => ArrayRef[Str|Undef]

  


=head2 TagKeyScope => Str

  


=head2 TagValueScope => Str

  



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Config>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

