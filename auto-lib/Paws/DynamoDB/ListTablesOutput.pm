
package Paws::DynamoDB::ListTablesOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has LastEvaluatedTableName => (is => 'ro', isa => Str);
  has TableNames => (is => 'ro', isa => ArrayRef[Maybe[Str]]);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{LastEvaluatedTableName}) {
      $res{LastEvaluatedTableName} = (map {
            "$_"
      } ($args->{LastEvaluatedTableName}))[0];
    }
    if (exists $args->{TableNames}) {
      $res{TableNames} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($args->{TableNames}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "LastEvaluatedTableName") {
        my $key = "LastEvaluatedTableName";
            $res->{$key} = "" . ( $_->nodeValue // '' );
      } elsif ($nodeName eq "TableNames") {
        my $key = "TableNames";
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
    if (exists $self->{LastEvaluatedTableName}) {
      $res{LastEvaluatedTableName} = (map {
            "$_"
      } ($self->LastEvaluatedTableName))[0];
    }
    if (exists $self->{TableNames}) {
      $res{TableNames} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->TableNames))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{LastEvaluatedTableName}) {
      $res{LastEvaluatedTableName} = (map {
            "$_"
      } ($self->LastEvaluatedTableName))[0];
    }
    if (exists $self->{TableNames}) {
      $res{TableNames} = (map {
            [ map { defined($_) ? "$_" : undef } @$_ ]
      } ($self->TableNames))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{LastEvaluatedTableName}) {
      my $key = "${prefix}LastEvaluatedTableName";
      do {
            $res->{$key} = "$_";
      } for $self->LastEvaluatedTableName;
    }

    if (exists $self->{TableNames}) {
      my $key = "${prefix}TableNames";
      do {
            for my $index ( 0 .. ( @$_ - 1 ) ) {
              my $orig_key = $key;
              my $key      = sprintf( '%s.member.%d', $orig_key, $index + 1 );
              my $val      = $_->[$index];
              $res->{$key} = defined($val) ? "$val" : undef;
            }
      } for $self->TableNames;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListTablesOutput

=head1 ATTRIBUTES


=head2 LastEvaluatedTableName => Str

The name of the last table in the current page of results. Use this
value as the C<ExclusiveStartTableName> in a new request to obtain the
next page of results, until all the table names are returned.

If you do not receive a C<LastEvaluatedTableName> value in the
response, this means that there are no more table names to be
retrieved.


=head2 TableNames => ArrayRef[Maybe[Str]]

The names of the tables associated with the current account at the
current endpoint. The maximum size of this array is 100.

If C<LastEvaluatedTableName> also appears in the output, you can use
this value as the C<ExclusiveStartTableName> parameter in a subsequent
C<ListTables> request and obtain the next page of results.


=head2 _request_id => Str


=cut

