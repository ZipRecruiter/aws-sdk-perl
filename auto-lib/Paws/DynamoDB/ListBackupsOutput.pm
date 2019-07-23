
package Paws::DynamoDB::ListBackupsOutput;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::CallResult';

  has BackupSummaries => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::BackupSummary']]);
  has LastEvaluatedBackupArn => (is => 'ro', isa => Str);

  has _request_id => (is => 'ro', isa => 'Str');

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupSummaries}) {
      $res{BackupSummaries} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::BackupSummary' ? $_ : do {
                  require Paws::DynamoDB::BackupSummary;
                  Paws::DynamoDB::BackupSummary->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{BackupSummaries}))[0];
    }
    if (exists $args->{LastEvaluatedBackupArn}) {
      $res{LastEvaluatedBackupArn} = (map {
            "$_"
      } ($args->{LastEvaluatedBackupArn}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "BackupSummaries") {
        my $key = "BackupSummaries";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::BackupSummary;
                Paws::DynamoDB::BackupSummary->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "LastEvaluatedBackupArn") {
        my $key = "LastEvaluatedBackupArn";
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
    if (exists $self->{BackupSummaries}) {
      $res{BackupSummaries} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->BackupSummaries))[0];
    }
    if (exists $self->{LastEvaluatedBackupArn}) {
      $res{LastEvaluatedBackupArn} = (map {
            "$_"
      } ($self->LastEvaluatedBackupArn))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BackupSummaries}) {
      $res{BackupSummaries} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->BackupSummaries))[0];
    }
    if (exists $self->{LastEvaluatedBackupArn}) {
      $res{LastEvaluatedBackupArn} = (map {
            "$_"
      } ($self->LastEvaluatedBackupArn))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{BackupSummaries}) {
      my $key = "${prefix}BackupSummaries";
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
      } for $self->BackupSummaries;
    }

    if (exists $self->{LastEvaluatedBackupArn}) {
      my $key = "${prefix}LastEvaluatedBackupArn";
      do {
            $res->{$key} = "$_";
      } for $self->LastEvaluatedBackupArn;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::ListBackupsOutput

=head1 ATTRIBUTES


=head2 BackupSummaries => ArrayRef[L<Paws::DynamoDB::BackupSummary>]

List of C<BackupSummary> objects.


=head2 LastEvaluatedBackupArn => Str

The ARN of the backup last evaluated when the current page of results
was returned, inclusive of the current page of results. This value may
be specified as the C<ExclusiveStartBackupArn> of a new C<ListBackups>
operation in order to fetch the next page of results.

If C<LastEvaluatedBackupArn> is empty, then the last page of results
has been processed and there are no more results to be retrieved.

If C<LastEvaluatedBackupArn> is not empty, this may or may not indicate
there is more data to be returned. All results are guaranteed to have
been returned if and only if no value for C<LastEvaluatedBackupArn> is
returned.


=head2 _request_id => Str


=cut

