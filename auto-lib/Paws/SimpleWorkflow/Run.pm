
package Paws::SimpleWorkflow::Run;
  use Moose;
  has RunId => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'runId' );

  has _request_id => (is => 'ro', isa => 'Str');

### main pod documentation begin ###

=head1 NAME

Paws::SimpleWorkflow::Run

=head1 ATTRIBUTES


=head2 RunId => Str

The C<runId> of a workflow execution. This ID is generated by the
service and can be used to uniquely identify the workflow execution
within a domain.


=head2 _request_id => Str


=cut

1;
