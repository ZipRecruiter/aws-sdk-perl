
package Paws::DynamoDB::ListTables;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has ExclusiveStartTableName => (is => 'ro', isa => Str);
  has Limit => (is => 'ro', isa => Int);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListTables');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::ListTablesOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ExclusiveStartTableName}) {
      $res{ExclusiveStartTableName} = (map {
            "$_"
      } ($args->{ExclusiveStartTableName}))[0];
    }
    if (exists $args->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($args->{Limit}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ExclusiveStartTableName") {
        my $key = "ExclusiveStartTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "Limit") {
        my $key = "Limit";
            $res->{$key} = int( $_->nodeValue // 0 );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ExclusiveStartTableName}) {
      $res{ExclusiveStartTableName} = (map {
            "$_"
      } ($self->ExclusiveStartTableName))[0];
    }
    if (exists $self->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($self->Limit))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ExclusiveStartTableName}) {
      $res{ExclusiveStartTableName} = (map {
            "$_"
      } ($self->ExclusiveStartTableName))[0];
    }
    if (exists $self->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($self->Limit))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ExclusiveStartTableName}) {
      my $key = "${prefix}ExclusiveStartTableName";
      do {
            $res->{$key} = "$_";
      } for $self->ExclusiveStartTableName;
    }

    if (exists $self->{Limit}) {
      my $key = "${prefix}Limit";
      do {
            $res->{$key} = int($_);
      } for $self->Limit;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListTables - Arguments for method ListTables on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListTables on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method ListTables.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ListTables.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
  # To list tables
  # This example lists all of the tables associated with the current AWS account
  # and endpoint.
    my $ListTablesOutput = $dynamodb->ListTables();

    # Results:
    my $TableNames = $ListTablesOutput->TableNames;

    # Returns a L<Paws::DynamoDB::ListTablesOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/ListTables>

=head1 ATTRIBUTES


=head2 ExclusiveStartTableName => Str

The first table name that this operation will evaluate. Use the value
that was returned for C<LastEvaluatedTableName> in a previous
operation, so that you can obtain the next page of results.



=head2 Limit => Int

A maximum number of table names to return. If this parameter is not
specified, the limit is 100.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ListTables in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

