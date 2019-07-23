
package Paws::DynamoDB::ListGlobalTables;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has ExclusiveStartGlobalTableName => (is => 'ro', isa => Str);
  has Limit => (is => 'ro', isa => Int);
  has RegionName => (is => 'ro', isa => Str);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListGlobalTables');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::ListGlobalTablesOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{ExclusiveStartGlobalTableName}) {
      $res{ExclusiveStartGlobalTableName} = (map {
            "$_"
      } ($args->{ExclusiveStartGlobalTableName}))[0];
    }
    if (exists $args->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($args->{Limit}))[0];
    }
    if (exists $args->{RegionName}) {
      $res{RegionName} = (map {
            "$_"
      } ($args->{RegionName}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "ExclusiveStartGlobalTableName") {
        my $key = "ExclusiveStartGlobalTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "Limit") {
        my $key = "Limit";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "RegionName") {
        my $key = "RegionName";
            $res->{$key} = "" . ( $_->nodeValue // '' );

      } else {
        # warn "Unrecognized element $nodeName";
      }
    }

    return $class->new_with_coercions($res);
  }

  sub to_hash_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ExclusiveStartGlobalTableName}) {
      $res{ExclusiveStartGlobalTableName} = (map {
            "$_"
      } ($self->ExclusiveStartGlobalTableName))[0];
    }
    if (exists $self->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($self->Limit))[0];
    }
    if (exists $self->{RegionName}) {
      $res{RegionName} = (map {
            "$_"
      } ($self->RegionName))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{ExclusiveStartGlobalTableName}) {
      $res{ExclusiveStartGlobalTableName} = (map {
            "$_"
      } ($self->ExclusiveStartGlobalTableName))[0];
    }
    if (exists $self->{Limit}) {
      $res{Limit} = (map {
            int($_)
      } ($self->Limit))[0];
    }
    if (exists $self->{RegionName}) {
      $res{RegionName} = (map {
            "$_"
      } ($self->RegionName))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{ExclusiveStartGlobalTableName}) {
      my $key = "${prefix}ExclusiveStartGlobalTableName";
      do {
            $res->{$key} = "$_";
      } for $self->ExclusiveStartGlobalTableName;
    }

    if (exists $self->{Limit}) {
      my $key = "${prefix}Limit";
      do {
            $res->{$key} = int($_);
      } for $self->Limit;
    }

    if (exists $self->{RegionName}) {
      my $key = "${prefix}RegionName";
      do {
            $res->{$key} = "$_";
      } for $self->RegionName;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListGlobalTables - Arguments for method ListGlobalTables on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListGlobalTables on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method ListGlobalTables.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ListGlobalTables.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
    my $ListGlobalTablesOutput = $dynamodb->ListGlobalTables(
      ExclusiveStartGlobalTableName => 'MyTableName',     # OPTIONAL
      Limit                         => 1,                 # OPTIONAL
      RegionName                    => 'MyRegionName',    # OPTIONAL
    );

    # Results:
    my $GlobalTables = $ListGlobalTablesOutput->GlobalTables;
    my $LastEvaluatedGlobalTableName =
      $ListGlobalTablesOutput->LastEvaluatedGlobalTableName;

    # Returns a L<Paws::DynamoDB::ListGlobalTablesOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/ListGlobalTables>

=head1 ATTRIBUTES


=head2 ExclusiveStartGlobalTableName => Str

The first global table name that this operation will evaluate.



=head2 Limit => Int

The maximum number of table names to return.



=head2 RegionName => Str

Lists the global tables in a specific region.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ListGlobalTables in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

