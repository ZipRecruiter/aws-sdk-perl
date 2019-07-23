package Paws::DynamoDB::SourceTableFeatureDetails;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has GlobalSecondaryIndexes => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::GlobalSecondaryIndexInfo']]);
  has LocalSecondaryIndexes => (is => 'ro', isa => ArrayRef[InstanceOf['Paws::DynamoDB::LocalSecondaryIndexInfo']]);
  has SSEDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::SSEDescription']);
  has StreamDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::StreamSpecification']);
  has TimeToLiveDescription => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::TimeToLiveDescription']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{GlobalSecondaryIndexes}) {
      $res{GlobalSecondaryIndexes} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::GlobalSecondaryIndexInfo' ? $_ : do {
                  require Paws::DynamoDB::GlobalSecondaryIndexInfo;
                  Paws::DynamoDB::GlobalSecondaryIndexInfo->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{GlobalSecondaryIndexes}))[0];
    }
    if (exists $args->{LocalSecondaryIndexes}) {
      $res{LocalSecondaryIndexes} = (map {
            [
              map {
                ref($_) eq 'Paws::DynamoDB::LocalSecondaryIndexInfo' ? $_ : do {
                  require Paws::DynamoDB::LocalSecondaryIndexInfo;
                  Paws::DynamoDB::LocalSecondaryIndexInfo->new_with_coercions($_);
                }
              } @$_
            ]
      } ($args->{LocalSecondaryIndexes}))[0];
    }
    if (exists $args->{SSEDescription}) {
      $res{SSEDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::SSEDescription' ? $_ : do {
              require Paws::DynamoDB::SSEDescription;
              Paws::DynamoDB::SSEDescription->new_with_coercions($_);
              }
      } ($args->{SSEDescription}))[0];
    }
    if (exists $args->{StreamDescription}) {
      $res{StreamDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::StreamSpecification' ? $_ : do {
              require Paws::DynamoDB::StreamSpecification;
              Paws::DynamoDB::StreamSpecification->new_with_coercions($_);
              }
      } ($args->{StreamDescription}))[0];
    }
    if (exists $args->{TimeToLiveDescription}) {
      $res{TimeToLiveDescription} = (map {
            ref($_) eq 'Paws::DynamoDB::TimeToLiveDescription' ? $_ : do {
              require Paws::DynamoDB::TimeToLiveDescription;
              Paws::DynamoDB::TimeToLiveDescription->new_with_coercions($_);
              }
      } ($args->{TimeToLiveDescription}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "GlobalSecondaryIndexes") {
        my $key = "GlobalSecondaryIndexes";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::GlobalSecondaryIndexInfo;
                Paws::DynamoDB::GlobalSecondaryIndexInfo->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "LocalSecondaryIndexes") {
        my $key = "LocalSecondaryIndexes";
            do {
              my $tmp = $res->{$key} // [];
              $res->{$key} = do {
                require Paws::DynamoDB::LocalSecondaryIndexInfo;
                Paws::DynamoDB::LocalSecondaryIndexInfo->new_from_xml($_);
              };
              push @$tmp, $res->{$key};
              $res->{$key} = $tmp;
              }
      } elsif ($nodeName eq "SSEDescription") {
        my $key = "SSEDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::SSEDescription;
              Paws::DynamoDB::SSEDescription->new_from_xml($_);
            };
      } elsif ($nodeName eq "StreamDescription") {
        my $key = "StreamDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::StreamSpecification;
              Paws::DynamoDB::StreamSpecification->new_from_xml($_);
            };
      } elsif ($nodeName eq "TimeToLiveDescription") {
        my $key = "TimeToLiveDescription";
            $res->{$key} = do {
              require Paws::DynamoDB::TimeToLiveDescription;
              Paws::DynamoDB::TimeToLiveDescription->new_from_xml($_);
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
    if (exists $self->{GlobalSecondaryIndexes}) {
      $res{GlobalSecondaryIndexes} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->GlobalSecondaryIndexes))[0];
    }
    if (exists $self->{LocalSecondaryIndexes}) {
      $res{LocalSecondaryIndexes} = (map {
            [ map { $_->to_hash_data } @$_ ]
      } ($self->LocalSecondaryIndexes))[0];
    }
    if (exists $self->{SSEDescription}) {
      $res{SSEDescription} = (map {
            $_->to_hash_data
      } ($self->SSEDescription))[0];
    }
    if (exists $self->{StreamDescription}) {
      $res{StreamDescription} = (map {
            $_->to_hash_data
      } ($self->StreamDescription))[0];
    }
    if (exists $self->{TimeToLiveDescription}) {
      $res{TimeToLiveDescription} = (map {
            $_->to_hash_data
      } ($self->TimeToLiveDescription))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{GlobalSecondaryIndexes}) {
      $res{GlobalSecondaryIndexes} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->GlobalSecondaryIndexes))[0];
    }
    if (exists $self->{LocalSecondaryIndexes}) {
      $res{LocalSecondaryIndexes} = (map {
            [ map { $_->to_json_data } @$_ ]
      } ($self->LocalSecondaryIndexes))[0];
    }
    if (exists $self->{SSEDescription}) {
      $res{SSEDescription} = (map {
            $_->to_json_data
      } ($self->SSEDescription))[0];
    }
    if (exists $self->{StreamDescription}) {
      $res{StreamDescription} = (map {
            $_->to_json_data
      } ($self->StreamDescription))[0];
    }
    if (exists $self->{TimeToLiveDescription}) {
      $res{TimeToLiveDescription} = (map {
            $_->to_json_data
      } ($self->TimeToLiveDescription))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{GlobalSecondaryIndexes}) {
      my $key = "${prefix}GlobalSecondaryIndexes";
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
      } for $self->GlobalSecondaryIndexes;
    }

    if (exists $self->{LocalSecondaryIndexes}) {
      my $key = "${prefix}LocalSecondaryIndexes";
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
      } for $self->LocalSecondaryIndexes;
    }

    if (exists $self->{SSEDescription}) {
      my $key = "${prefix}SSEDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->SSEDescription;
    }

    if (exists $self->{StreamDescription}) {
      my $key = "${prefix}StreamDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->StreamDescription;
    }

    if (exists $self->{TimeToLiveDescription}) {
      my $key = "${prefix}TimeToLiveDescription";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->TimeToLiveDescription;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::SourceTableFeatureDetails

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::SourceTableFeatureDetails object:

  $service_obj->Method(Att1 => { GlobalSecondaryIndexes => $value, ..., TimeToLiveDescription => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::SourceTableFeatureDetails object:

  $result = $service_obj->Method(...);
  $result->Att1->GlobalSecondaryIndexes

=head1 DESCRIPTION

Contains the details of the features enabled on the table when the
backup was created. For example, LSIs, GSIs, streams, TTL.

=head1 ATTRIBUTES


=head2 GlobalSecondaryIndexes => ArrayRef[L<Paws::DynamoDB::GlobalSecondaryIndexInfo>]

  Represents the GSI properties for the table when the backup was
created. It includes the IndexName, KeySchema, Projection and
ProvisionedThroughput for the GSIs on the table at the time of backup.


=head2 LocalSecondaryIndexes => ArrayRef[L<Paws::DynamoDB::LocalSecondaryIndexInfo>]

  Represents the LSI properties for the table when the backup was
created. It includes the IndexName, KeySchema and Projection for the
LSIs on the table at the time of backup.


=head2 SSEDescription => L<Paws::DynamoDB::SSEDescription>

  The description of the server-side encryption status on the table when
the backup was created.


=head2 StreamDescription => L<Paws::DynamoDB::StreamSpecification>

  Stream settings on the table when the backup was created.


=head2 TimeToLiveDescription => L<Paws::DynamoDB::TimeToLiveDescription>

  Time to Live settings on the table when the backup was created.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
