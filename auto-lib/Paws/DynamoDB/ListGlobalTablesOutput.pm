
package Paws::DynamoDB::ListGlobalTablesOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has GlobalTables => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::GlobalTable']]);
  has LastEvaluatedGlobalTableName => (is => 'ro', isa => Str);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{GlobalTables}) {
      $res{GlobalTables} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::GlobalTable' ? $_ : do {
                  require Paws::DynamoDB::GlobalTable;
                  Paws::DynamoDB::GlobalTable->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{GlobalTables}))[0];
    }
    if (exists $args->{LastEvaluatedGlobalTableName}) {
      $res{LastEvaluatedGlobalTableName} = (map {
            "$_"
      } ($args->{LastEvaluatedGlobalTableName}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "GlobalTables") {
        my $key = "GlobalTables";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::GlobalTable;
                Paws::DynamoDB::GlobalTable->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "LastEvaluatedGlobalTableName") {
        my $key = "LastEvaluatedGlobalTableName";
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
    if (exists $self->{GlobalTables}) {
      $res{GlobalTables} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->GlobalTables))[0];
    }
    if (exists $self->{LastEvaluatedGlobalTableName}) {
      $res{LastEvaluatedGlobalTableName} = (map {
            "$_"
      } ($self->LastEvaluatedGlobalTableName))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{GlobalTables}) {
      $res{GlobalTables} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->GlobalTables))[0];
    }
    if (exists $self->{LastEvaluatedGlobalTableName}) {
      $res{LastEvaluatedGlobalTableName} = (map {
            "$_"
      } ($self->LastEvaluatedGlobalTableName))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{GlobalTables}) {
      my $key = "${prefix}GlobalTables";
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
      } for $self->GlobalTables;
    }

    if (exists $self->{LastEvaluatedGlobalTableName}) {
      my $key = "${prefix}LastEvaluatedGlobalTableName";
      do {
            $res->{$key} = "$_";
      } for $self->LastEvaluatedGlobalTableName;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListGlobalTablesOutput

=head1 ATTRIBUTES


=head2 GlobalTables => ArrayRef[L<Paws::DynamoDB::GlobalTable>]

List of global table names.


=head2 LastEvaluatedGlobalTableName => Str

Last evaluated global table name.


=head2 _request_id => Str


=cut

