
package Paws::Lambda::PutFunctionConcurrency;
  use Moose;
  has FunctionName => (is => 'ro', isa => 'Str', traits => ['ParamInURI'], uri_name => 'FunctionName', required => 1);
  has ReservedConcurrentExecutions => (is => 'ro', isa => 'Int', required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'PutFunctionConcurrency');
  class_has _api_uri  => (isa => 'Str', is => 'ro', default => '/2017-10-31/functions/{FunctionName}/concurrency');
  class_has _api_method  => (isa => 'Str', is => 'ro', default => 'PUT');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::Lambda::Concurrency');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Lambda::PutFunctionConcurrency - Arguments for method PutFunctionConcurrency on L<Paws::Lambda>

=head1 DESCRIPTION

This class represents the parameters used for calling the method PutFunctionConcurrency on the 
AWS Lambda service. Use the attributes of this class
as arguments to method PutFunctionConcurrency.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to PutFunctionConcurrency.

As an example:

  $service_obj->PutFunctionConcurrency(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 B<REQUIRED> FunctionName => Str

The name of the function you are setting concurrent execution limits
on.



=head2 B<REQUIRED> ReservedConcurrentExecutions => Int

The concurrent execution limit reserved for this function.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method PutFunctionConcurrency in L<Paws::Lambda>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
