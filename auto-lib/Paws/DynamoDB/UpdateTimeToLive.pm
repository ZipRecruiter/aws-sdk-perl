
package Paws::DynamoDB::UpdateTimeToLive;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has TableName => (is => 'ro', isa => Str, required => 1);
  has TimeToLiveSpecification => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::TimeToLiveSpecification'], required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateTimeToLive');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::UpdateTimeToLiveOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($args->{TableName}))[0];
    }
    if (exists $args->{TimeToLiveSpecification}) {
      $res{TimeToLiveSpecification} = (map {
            ref($_) eq 'Paws::DynamoDB::TimeToLiveSpecification' ? $_ : do {
              require Paws::DynamoDB::TimeToLiveSpecification;
              Paws::DynamoDB::TimeToLiveSpecification->new_with_coercions($_);
              }
      } ($args->{TimeToLiveSpecification}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "TableName") {
        my $key = "TableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TimeToLiveSpecification") {
        my $key = "TimeToLiveSpecification";
            $res->{$key} = do {
              require Paws::DynamoDB::TimeToLiveSpecification;
              Paws::DynamoDB::TimeToLiveSpecification->new_from_xml($_);
            };

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{TimeToLiveSpecification}) {
      $res{TimeToLiveSpecification} = (map {
            $_->to_hash_data
      } ($self->TimeToLiveSpecification))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{TimeToLiveSpecification}) {
      $res{TimeToLiveSpecification} = (map {
            $_->to_json_data
      } ($self->TimeToLiveSpecification))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{TableName}) {
      my $key = "${prefix}TableName";
      do {
            $res->{$key} = "$_";
      } for $self->TableName;
    }

    if (exists $self->{TimeToLiveSpecification}) {
      my $key = "${prefix}TimeToLiveSpecification";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->TimeToLiveSpecification;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::UpdateTimeToLive - Arguments for method UpdateTimeToLive on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method UpdateTimeToLive on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method UpdateTimeToLive.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to UpdateTimeToLive.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $UpdateTimeToLiveOutput = $dynamodb->UpdateTimeToLive(
      TableName               => 'MyTableName',
      TimeToLiveSpecification => {
        AttributeName => 'MyTimeToLiveAttributeName',    # min: 1, max: 255
        Enabled       => 1,

      },

    );

    # Results:
    my $TimeToLiveSpecification =
      $UpdateTimeToLiveOutput->TimeToLiveSpecification;

    # Returns a L<Paws::DynamoDB::UpdateTimeToLiveOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/UpdateTimeToLive>

=head1 ATTRIBUTES


=head2 B<REQUIRED> TableName => Str

The name of the table to be configured.



=head2 B<REQUIRED> TimeToLiveSpecification => L<Paws::DynamoDB::TimeToLiveSpecification>

Represents the settings used to enable or disable Time to Live for the
specified table.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method UpdateTimeToLive in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

