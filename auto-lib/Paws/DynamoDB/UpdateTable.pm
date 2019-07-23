
package Paws::DynamoDB::UpdateTable;
  use Moose;
  use Types::Standard -types;
  use MooseX::ClassAttribute;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallArgs';

  has AttributeDefinitions => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::AttributeDefinition']]);
  has BillingMode => (is => 'ro', isa => Str);
  has GlobalSecondaryIndexUpdates => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::GlobalSecondaryIndexUpdate']]);
  has ProvisionedThroughput => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ProvisionedThroughput']);
  has SSESpecification => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::SSESpecification']);
  has StreamSpecification => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::StreamSpecification']);
  has TableName => (is => 'ro', isa => Str, required => 1);


  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateTable');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DynamoDB::UpdateTableOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{AttributeDefinitions}) {
      $res{AttributeDefinitions} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::AttributeDefinition' ? $_ : do {
                  require Paws::DynamoDB::AttributeDefinition;
                  Paws::DynamoDB::AttributeDefinition->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{AttributeDefinitions}))[0];
    }
    if (exists $args->{BillingMode}) {
      $res{BillingMode} = (map {
            "$_"
      } ($args->{BillingMode}))[0];
    }
    if (exists $args->{GlobalSecondaryIndexUpdates}) {
      $res{GlobalSecondaryIndexUpdates} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::GlobalSecondaryIndexUpdate' ? $_ : do {
                  require Paws::DynamoDB::GlobalSecondaryIndexUpdate;
                  Paws::DynamoDB::GlobalSecondaryIndexUpdate->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{GlobalSecondaryIndexUpdates}))[0];
    }
    if (exists $args->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            ref($_) eq 'Paws::DynamoDB::ProvisionedThroughput' ? $_ : do {
              require Paws::DynamoDB::ProvisionedThroughput;
              Paws::DynamoDB::ProvisionedThroughput->new_with_coercions($_);
              }
      } ($args->{ProvisionedThroughput}))[0];
    }
    if (exists $args->{SSESpecification}) {
      $res{SSESpecification} = (map {
            ref($_) eq 'Paws::DynamoDB::SSESpecification' ? $_ : do {
              require Paws::DynamoDB::SSESpecification;
              Paws::DynamoDB::SSESpecification->new_with_coercions($_);
              }
      } ($args->{SSESpecification}))[0];
    }
    if (exists $args->{StreamSpecification}) {
      $res{StreamSpecification} = (map {
            ref($_) eq 'Paws::DynamoDB::StreamSpecification' ? $_ : do {
              require Paws::DynamoDB::StreamSpecification;
              Paws::DynamoDB::StreamSpecification->new_with_coercions($_);
              }
      } ($args->{StreamSpecification}))[0];
    }
    if (exists $args->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($args->{TableName}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "AttributeDefinitions") {
        my $key = "AttributeDefinitions";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::AttributeDefinition;
                Paws::DynamoDB::AttributeDefinition->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "BillingMode") {
        my $key = "BillingMode";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "GlobalSecondaryIndexUpdates") {
        my $key = "GlobalSecondaryIndexUpdates";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::GlobalSecondaryIndexUpdate;
                Paws::DynamoDB::GlobalSecondaryIndexUpdate->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "ProvisionedThroughput") {
        my $key = "ProvisionedThroughput";
            $res->{$key} = do {
              require Paws::DynamoDB::ProvisionedThroughput;
              Paws::DynamoDB::ProvisionedThroughput->new_from_xml($_);
            };
      } elsif ($nodeName eq "SSESpecification") {
        my $key = "SSESpecification";
            $res->{$key} = do {
              require Paws::DynamoDB::SSESpecification;
              Paws::DynamoDB::SSESpecification->new_from_xml($_);
            };
      } elsif ($nodeName eq "StreamSpecification") {
        my $key = "StreamSpecification";
            $res->{$key} = do {
              require Paws::DynamoDB::StreamSpecification;
              Paws::DynamoDB::StreamSpecification->new_from_xml($_);
            };
      } elsif ($nodeName eq "TableName") {
        my $key = "TableName";
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
    if (exists $self->{AttributeDefinitions}) {
      $res{AttributeDefinitions} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->AttributeDefinitions))[0];
    }
    if (exists $self->{BillingMode}) {
      $res{BillingMode} = (map {
            "$_"
      } ($self->BillingMode))[0];
    }
    if (exists $self->{GlobalSecondaryIndexUpdates}) {
      $res{GlobalSecondaryIndexUpdates} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->GlobalSecondaryIndexUpdates))[0];
    }
    if (exists $self->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            $_->to_hash_data
      } ($self->ProvisionedThroughput))[0];
    }
    if (exists $self->{SSESpecification}) {
      $res{SSESpecification} = (map {
            $_->to_hash_data
      } ($self->SSESpecification))[0];
    }
    if (exists $self->{StreamSpecification}) {
      $res{StreamSpecification} = (map {
            $_->to_hash_data
      } ($self->StreamSpecification))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{AttributeDefinitions}) {
      $res{AttributeDefinitions} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->AttributeDefinitions))[0];
    }
    if (exists $self->{BillingMode}) {
      $res{BillingMode} = (map {
            "$_"
      } ($self->BillingMode))[0];
    }
    if (exists $self->{GlobalSecondaryIndexUpdates}) {
      $res{GlobalSecondaryIndexUpdates} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->GlobalSecondaryIndexUpdates))[0];
    }
    if (exists $self->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            $_->to_json_data
      } ($self->ProvisionedThroughput))[0];
    }
    if (exists $self->{SSESpecification}) {
      $res{SSESpecification} = (map {
            $_->to_json_data
      } ($self->SSESpecification))[0];
    }
    if (exists $self->{StreamSpecification}) {
      $res{StreamSpecification} = (map {
            $_->to_json_data
      } ($self->StreamSpecification))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{AttributeDefinitions}) {
      my $key = "${prefix}AttributeDefinitions";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $_->to_parameter_data( $res, $key );
                }
                for $val;
            }
      } for $self->AttributeDefinitions;
    }

    if (exists $self->{BillingMode}) {
      my $key = "${prefix}BillingMode";
      do {
            $res->{$key} = "$_";
      } for $self->BillingMode;
    }

    if (exists $self->{GlobalSecondaryIndexUpdates}) {
      my $key = "${prefix}GlobalSecondaryIndexUpdates";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              do {
                $_->to_parameter_data( $res, $key );
                }
                for $val;
            }
      } for $self->GlobalSecondaryIndexUpdates;
    }

    if (exists $self->{ProvisionedThroughput}) {
      my $key = "${prefix}ProvisionedThroughput";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ProvisionedThroughput;
    }

    if (exists $self->{SSESpecification}) {
      my $key = "${prefix}SSESpecification";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->SSESpecification;
    }

    if (exists $self->{StreamSpecification}) {
      my $key = "${prefix}StreamSpecification";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->StreamSpecification;
    }

    if (exists $self->{TableName}) {
      my $key = "${prefix}TableName";
      do {
            $res->{$key} = "$_";
      } for $self->TableName;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::UpdateTable - Arguments for method UpdateTable on L<Paws::DynamoDB>

=head1 DESCRIPTION

This class represents the parameters used for calling the method UpdateTable on the
L<Amazon DynamoDB|Paws::DynamoDB> service. Use the attributes of this class
as arguments to method UpdateTable.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to UpdateTable.

=head1 SYNOPSIS

    my $dynamodb = Paws->service('DynamoDB');
   # To modify a table's provisioned throughput
   # This example increases the provisioned read and write capacity on the Music
   # table.
    my $UpdateTableOutput = $dynamodb->UpdateTable(
      'ProvisionedThroughput' => {
        'ReadCapacityUnits'  => 10,
        'WriteCapacityUnits' => 10
      },
      'TableName' => 'MusicCollection'
    );

    # Results:
    my $TableDescription = $UpdateTableOutput->TableDescription;

    # Returns a L<Paws::DynamoDB::UpdateTableOutput> object.

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.
For the AWS API documentation, see L<https://docs.aws.amazon.com/goto/WebAPI/dynamodb/UpdateTable>

=head1 ATTRIBUTES


=head2 AttributeDefinitions => ArrayRef[L<Paws::DynamoDB::AttributeDefinition>]

An array of attributes that describe the key schema for the table and
indexes. If you are adding a new global secondary index to the table,
C<AttributeDefinitions> must include the key element(s) of the new
index.



=head2 BillingMode => Str

Controls how you are charged for read and write throughput and how you
manage capacity. When switching from pay-per-request to provisioned
capacity, initial provisioned capacity values must be set. The initial
provisioned capacity values are estimated based on the consumed read
and write capacity of your table and global secondary indexes over the
past 30 minutes.

=over

=item *

C<PROVISIONED> - Sets the billing mode to C<PROVISIONED>. We recommend
using C<PROVISIONED> for predictable workloads.

=item *

C<PAY_PER_REQUEST> - Sets the billing mode to C<PAY_PER_REQUEST>. We
recommend using C<PAY_PER_REQUEST> for unpredictable workloads.

=back


Valid values are: C<"PROVISIONED">, C<"PAY_PER_REQUEST">

=head2 GlobalSecondaryIndexUpdates => ArrayRef[L<Paws::DynamoDB::GlobalSecondaryIndexUpdate>]

An array of one or more global secondary indexes for the table. For
each index in the array, you can request one action:

=over

=item *

C<Create> - add a new global secondary index to the table.

=item *

C<Update> - modify the provisioned throughput settings of an existing
global secondary index.

=item *

C<Delete> - remove a global secondary index from the table.

=back

For more information, see Managing Global Secondary Indexes
(http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html)
in the I<Amazon DynamoDB Developer Guide>.



=head2 ProvisionedThroughput => L<Paws::DynamoDB::ProvisionedThroughput>

The new provisioned throughput settings for the specified table or
index.



=head2 SSESpecification => L<Paws::DynamoDB::SSESpecification>

The new server-side encryption settings for the specified table.



=head2 StreamSpecification => L<Paws::DynamoDB::StreamSpecification>

Represents the DynamoDB Streams configuration for the table.

You will receive a C<ResourceInUseException> if you attempt to enable a
stream on a table that already has a stream, or if you attempt to
disable a stream on a table which does not have a stream.



=head2 B<REQUIRED> TableName => Str

The name of the table to be updated.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method UpdateTable in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut

