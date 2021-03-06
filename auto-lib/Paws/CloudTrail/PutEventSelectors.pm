
package Paws::CloudTrail::PutEventSelectors;
  use Moose;
  has EventSelectors => (is => 'ro', isa => 'ArrayRef[Paws::CloudTrail::EventSelector]', required => 1);
  has TrailName => (is => 'ro', isa => 'Str', required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'PutEventSelectors');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::CloudTrail::PutEventSelectorsResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::CloudTrail::PutEventSelectors - Arguments for method PutEventSelectors on L<Paws::CloudTrail>

=head1 DESCRIPTION

This class represents the parameters used for calling the method PutEventSelectors on the
L<AWS CloudTrail|Paws::CloudTrail> service. Use the attributes of this class
as arguments to method PutEventSelectors.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to PutEventSelectors.

=head1 SYNOPSIS

    my $cloudtrail = Paws->service('CloudTrail');
    my $PutEventSelectorsResponse = $cloudtrail->PutEventSelectors(
      EventSelectors => [
        {
          DataResources => [
            {
              Type   => 'MyString',    # OPTIONAL
              Values => [
                'MyString', ...        # OPTIONAL
              ],                       # OPTIONAL
            },
            ...
          ],                           # OPTIONAL
          IncludeManagementEvents => 1,    # OPTIONAL
          ReadWriteType =>
            'ReadOnly',    # values: ReadOnly, WriteOnly, All; OPTIONAL
        },
        ...
      ],
      TrailName => 'MyString',

    );

    # Results:
    my $EventSelectors = $PutEventSelectorsResponse->EventSelectors;
    my $TrailARN       = $PutEventSelectorsResponse->TrailARN;

    # Returns a L<Paws::CloudTrail::PutEventSelectorsResponse> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/cloudtrail/PutEventSelectors>

=head1 ATTRIBUTES


=head2 B<REQUIRED> EventSelectors => ArrayRef[L<Paws::CloudTrail::EventSelector>]

Specifies the settings for your event selectors. You can configure up
to five event selectors for a trail.



=head2 B<REQUIRED> TrailName => Str

Specifies the name of the trail or trail ARN. If you specify a trail
name, the string must meet the following requirements:

=over

=item *

Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
underscores (_), or dashes (-)

=item *

Start with a letter or number, and end with a letter or number

=item *

Be between 3 and 128 characters

=item *

Have no adjacent periods, underscores or dashes. Names like
C<my-_namespace> and C<my--namespace> are invalid.

=item *

Not be in IP address format (for example, 192.168.5.4)

=back

If you specify a trail ARN, it must be in the format:

C<arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail>




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method PutEventSelectors in L<Paws::CloudTrail>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

