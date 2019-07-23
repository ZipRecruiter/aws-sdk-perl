package Paws::DynamoDB::SourceTableDetails;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has BillingMode => (is => 'ro', isa => Str);
  has ItemCount => (is => 'ro', isa => Int);
  has KeySchema => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::KeySchemaElement']], required => 1);
  has ProvisionedThroughput => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::ProvisionedThroughput'], required => 1);
  has TableArn => (is => 'ro', isa => Str);
  has TableCreationDateTime => (is => 'ro', isa => Str, required => 1);
  has TableId => (is => 'ro', isa => Str, required => 1);
  has TableName => (is => 'ro', isa => Str, required => 1);
  has TableSizeBytes => (is => 'ro', isa => Int);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BillingMode}) {
      $res{BillingMode} = (map {
            "$_"
      } ($args->{BillingMode}))[0];
    }
    if (exists $args->{ItemCount}) {
      $res{ItemCount} = (map {
            int($_)
      } ($args->{ItemCount}))[0];
    }
    if (exists $args->{KeySchema}) {
      $res{KeySchema} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::KeySchemaElement' ? $_ : do {
                  require Paws::DynamoDB::KeySchemaElement;
                  Paws::DynamoDB::KeySchemaElement->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{KeySchema}))[0];
    }
    if (exists $args->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            ref($_) eq 'Paws::DynamoDB::ProvisionedThroughput' ? $_ : do {
              require Paws::DynamoDB::ProvisionedThroughput;
              Paws::DynamoDB::ProvisionedThroughput->new_with_coercions($_);
              }
      } ($args->{ProvisionedThroughput}))[0];
    }
    if (exists $args->{TableArn}) {
      $res{TableArn} = (map {
            "$_"
      } ($args->{TableArn}))[0];
    }
    if (exists $args->{TableCreationDateTime}) {
      $res{TableCreationDateTime} = (map {
            "$_"
      } ($args->{TableCreationDateTime}))[0];
    }
    if (exists $args->{TableId}) {
      $res{TableId} = (map {
            "$_"
      } ($args->{TableId}))[0];
    }
    if (exists $args->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($args->{TableName}))[0];
    }
    if (exists $args->{TableSizeBytes}) {
      $res{TableSizeBytes} = (map {
            int($_)
      } ($args->{TableSizeBytes}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "BillingMode") {
        my $key = "BillingMode";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "ItemCount") {
        my $key = "ItemCount";
            $res->{$key} = int( $_->nodeValue // 0 );
      } elsif ($nodeName eq "KeySchema") {
        my $key = "KeySchema";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::KeySchemaElement;
                Paws::DynamoDB::KeySchemaElement->new_from_xml($_);
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
      } elsif ($nodeName eq "TableArn") {
        my $key = "TableArn";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableCreationDateTime") {
        my $key = "TableCreationDateTime";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableId") {
        my $key = "TableId";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableName") {
        my $key = "TableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableSizeBytes") {
        my $key = "TableSizeBytes";
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
    if (exists $self->{BillingMode}) {
      $res{BillingMode} = (map {
            "$_"
      } ($self->BillingMode))[0];
    }
    if (exists $self->{ItemCount}) {
      $res{ItemCount} = (map {
            int($_)
      } ($self->ItemCount))[0];
    }
    if (exists $self->{KeySchema}) {
      $res{KeySchema} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->KeySchema))[0];
    }
    if (exists $self->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            $_->to_hash_data
      } ($self->ProvisionedThroughput))[0];
    }
    if (exists $self->{TableArn}) {
      $res{TableArn} = (map {
            "$_"
      } ($self->TableArn))[0];
    }
    if (exists $self->{TableCreationDateTime}) {
      $res{TableCreationDateTime} = (map {
            "$_"
      } ($self->TableCreationDateTime))[0];
    }
    if (exists $self->{TableId}) {
      $res{TableId} = (map {
            "$_"
      } ($self->TableId))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{TableSizeBytes}) {
      $res{TableSizeBytes} = (map {
            int($_)
      } ($self->TableSizeBytes))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BillingMode}) {
      $res{BillingMode} = (map {
            "$_"
      } ($self->BillingMode))[0];
    }
    if (exists $self->{ItemCount}) {
      $res{ItemCount} = (map {
            int($_)
      } ($self->ItemCount))[0];
    }
    if (exists $self->{KeySchema}) {
      $res{KeySchema} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->KeySchema))[0];
    }
    if (exists $self->{ProvisionedThroughput}) {
      $res{ProvisionedThroughput} = (map {
            $_->to_json_data
      } ($self->ProvisionedThroughput))[0];
    }
    if (exists $self->{TableArn}) {
      $res{TableArn} = (map {
            "$_"
      } ($self->TableArn))[0];
    }
    if (exists $self->{TableCreationDateTime}) {
      $res{TableCreationDateTime} = (map {
            "$_"
      } ($self->TableCreationDateTime))[0];
    }
    if (exists $self->{TableId}) {
      $res{TableId} = (map {
            "$_"
      } ($self->TableId))[0];
    }
    if (exists $self->{TableName}) {
      $res{TableName} = (map {
            "$_"
      } ($self->TableName))[0];
    }
    if (exists $self->{TableSizeBytes}) {
      $res{TableSizeBytes} = (map {
            int($_)
      } ($self->TableSizeBytes))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{BillingMode}) {
      my $key = "${prefix}BillingMode";
      do {
            $res->{$key} = "$_";
      } for $self->BillingMode;
    }

    if (exists $self->{ItemCount}) {
      my $key = "${prefix}ItemCount";
      do {
            $res->{$key} = int($_);
      } for $self->ItemCount;
    }

    if (exists $self->{KeySchema}) {
      my $key = "${prefix}KeySchema";
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
      } for $self->KeySchema;
    }

    if (exists $self->{ProvisionedThroughput}) {
      my $key = "${prefix}ProvisionedThroughput";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->ProvisionedThroughput;
    }

    if (exists $self->{TableArn}) {
      my $key = "${prefix}TableArn";
      do {
            $res->{$key} = "$_";
      } for $self->TableArn;
    }

    if (exists $self->{TableCreationDateTime}) {
      my $key = "${prefix}TableCreationDateTime";
      do {
            $res->{$key} = "$_";
      } for $self->TableCreationDateTime;
    }

    if (exists $self->{TableId}) {
      my $key = "${prefix}TableId";
      do {
            $res->{$key} = "$_";
      } for $self->TableId;
    }

    if (exists $self->{TableName}) {
      my $key = "${prefix}TableName";
      do {
            $res->{$key} = "$_";
      } for $self->TableName;
    }

    if (exists $self->{TableSizeBytes}) {
      my $key = "${prefix}TableSizeBytes";
      do {
            $res->{$key} = int($_);
      } for $self->TableSizeBytes;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::SourceTableDetails

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::SourceTableDetails object:

  $service_obj->Method(Att1 => { BillingMode => $value, ..., TableSizeBytes => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::SourceTableDetails object:

  $result = $service_obj->Method(...);
  $result->Att1->BillingMode

=head1 DESCRIPTION

Contains the details of the table when the backup was created.

=head1 ATTRIBUTES


=head2 BillingMode => Str

  Controls how you are charged for read and write throughput and how you
manage capacity. This setting can be changed later.

=over

=item *

C<PROVISIONED> - Sets the read/write capacity mode to C<PROVISIONED>.
We recommend using C<PROVISIONED> for predictable workloads.

=item *

C<PAY_PER_REQUEST> - Sets the read/write capacity mode to
C<PAY_PER_REQUEST>. We recommend using C<PAY_PER_REQUEST> for
unpredictable workloads.

=back



=head2 ItemCount => Int

  Number of items in the table. Please note this is an approximate value.


=head2 B<REQUIRED> KeySchema => ArrayRef[L<Paws::DynamoDB::KeySchemaElement>]

  Schema of the table.


=head2 B<REQUIRED> ProvisionedThroughput => L<Paws::DynamoDB::ProvisionedThroughput>

  Read IOPs and Write IOPS on the table when the backup was created.


=head2 TableArn => Str

  ARN of the table for which backup was created.


=head2 B<REQUIRED> TableCreationDateTime => Str

  Time when the source table was created.


=head2 B<REQUIRED> TableId => Str

  Unique identifier for the table for which the backup was created.


=head2 B<REQUIRED> TableName => Str

  The name of the table for which the backup was created.


=head2 TableSizeBytes => Int

  Size of the table in bytes. Please note this is an approximate value.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
