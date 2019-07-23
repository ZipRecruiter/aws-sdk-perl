package Paws::DynamoDB::BackupDescription;
  use Moose;
  use Types::Standard -types;
  use namespace::clean -except => 'meta';
  with 'Paws::API::Object';

  has BackupDetails => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::BackupDetails']);
  has SourceTableDetails => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::SourceTableDetails']);
  has SourceTableFeatureDetails => (is => 'ro', isa => InstanceOf['Paws::DynamoDB::SourceTableFeatureDetails']);

  sub new_with_coercions {
    my ($class, $args) = @_;

    my %res = %$args;
    if (exists $args->{BackupDetails}) {
      $res{BackupDetails} = (map {
            ref($_) eq 'Paws::DynamoDB::BackupDetails' ? $_ : do {
              require Paws::DynamoDB::BackupDetails;
              Paws::DynamoDB::BackupDetails->new_with_coercions($_);
              }
      } ($args->{BackupDetails}))[0];
    }
    if (exists $args->{SourceTableDetails}) {
      $res{SourceTableDetails} = (map {
            ref($_) eq 'Paws::DynamoDB::SourceTableDetails' ? $_ : do {
              require Paws::DynamoDB::SourceTableDetails;
              Paws::DynamoDB::SourceTableDetails->new_with_coercions($_);
              }
      } ($args->{SourceTableDetails}))[0];
    }
    if (exists $args->{SourceTableFeatureDetails}) {
      $res{SourceTableFeatureDetails} = (map {
            ref($_) eq 'Paws::DynamoDB::SourceTableFeatureDetails' ? $_ : do {
              require Paws::DynamoDB::SourceTableFeatureDetails;
              Paws::DynamoDB::SourceTableFeatureDetails->new_with_coercions($_);
              }
      } ($args->{SourceTableFeatureDetails}))[0];
    }

    return $class->new(\%res);
  }

  sub new_from_xml {
    my ($class, $xml) = @_;

    my $res = {};
    for ($xml->childNodes) {
      if (!defined(my $nodeName = $_->nodeName)) {
      } elsif ($nodeName eq "BackupDetails") {
        my $key = "BackupDetails";
            $res->{$key} = do {
              require Paws::DynamoDB::BackupDetails;
              Paws::DynamoDB::BackupDetails->new_from_xml($_);
            };
      } elsif ($nodeName eq "SourceTableDetails") {
        my $key = "SourceTableDetails";
            $res->{$key} = do {
              require Paws::DynamoDB::SourceTableDetails;
              Paws::DynamoDB::SourceTableDetails->new_from_xml($_);
            };
      } elsif ($nodeName eq "SourceTableFeatureDetails") {
        my $key = "SourceTableFeatureDetails";
            $res->{$key} = do {
              require Paws::DynamoDB::SourceTableFeatureDetails;
              Paws::DynamoDB::SourceTableFeatureDetails->new_from_xml($_);
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
    if (exists $self->{BackupDetails}) {
      $res{BackupDetails} = (map {
            $_->to_hash_data
      } ($self->BackupDetails))[0];
    }
    if (exists $self->{SourceTableDetails}) {
      $res{SourceTableDetails} = (map {
            $_->to_hash_data
      } ($self->SourceTableDetails))[0];
    }
    if (exists $self->{SourceTableFeatureDetails}) {
      $res{SourceTableFeatureDetails} = (map {
            $_->to_hash_data
      } ($self->SourceTableFeatureDetails))[0];
    }

    return \%res;
  }

  sub to_json_data {
    my ($self) = @_;

    my %res;
    if (exists $self->{BackupDetails}) {
      $res{BackupDetails} = (map {
            $_->to_json_data
      } ($self->BackupDetails))[0];
    }
    if (exists $self->{SourceTableDetails}) {
      $res{SourceTableDetails} = (map {
            $_->to_json_data
      } ($self->SourceTableDetails))[0];
    }
    if (exists $self->{SourceTableFeatureDetails}) {
      $res{SourceTableFeatureDetails} = (map {
            $_->to_json_data
      } ($self->SourceTableFeatureDetails))[0];
    }

    return \%res;
  }

  sub to_parameter_data {
    my ($self, $res, $prefix) = @_;
    $res //= {};
    $prefix = defined $prefix ? "$prefix." : "";


    if (exists $self->{BackupDetails}) {
      my $key = "${prefix}BackupDetails";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->BackupDetails;
    }

    if (exists $self->{SourceTableDetails}) {
      my $key = "${prefix}SourceTableDetails";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->SourceTableDetails;
    }

    if (exists $self->{SourceTableFeatureDetails}) {
      my $key = "${prefix}SourceTableFeatureDetails";
      do {
            $_->to_parameter_data( $res, $key );
      } for $self->SourceTableFeatureDetails;
    }

    return $res;
  }


  __PACKAGE__->meta->make_immutable;
1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB::BackupDescription

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::DynamoDB::BackupDescription object:

  $service_obj->Method(Att1 => { BackupDetails => $value, ..., SourceTableFeatureDetails => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::DynamoDB::BackupDescription object:

  $result = $service_obj->Method(...);
  $result->Att1->BackupDetails

=head1 DESCRIPTION

Contains the description of the backup created for the table.

=head1 ATTRIBUTES


=head2 BackupDetails => L<Paws::DynamoDB::BackupDetails>

  Contains the details of the backup created for the table.


=head2 SourceTableDetails => L<Paws::DynamoDB::SourceTableDetails>

  Contains the details of the table when the backup was created.


=head2 SourceTableFeatureDetails => L<Paws::DynamoDB::SourceTableFeatureDetails>

  Contains the details of the features enabled on the table when the
backup was created. For example, LSIs, GSIs, streams, TTL.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::DynamoDB>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: L<https://github.com/pplu/aws-sdk-perl>

Please report bugs to: L<https://github.com/pplu/aws-sdk-perl/issues>

=cut
