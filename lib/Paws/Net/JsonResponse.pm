package Paws::Net::JsonResponse;
  use Moose;
  use JSON::MaybeXS;
  use Carp qw(croak);
  use Paws::Exception;

  sub process {
    my ($self, $call_object, $response) = @_;

    if ($response->has_header('x-amz-crc32')) {
      require String::CRC32;
      my $crc = String::CRC32::crc32($response->content);
      return Paws::Exception->new(
        code => 'Crc32Error',
        message => 'Content CRC32 mismatch',
        request_id => $response->header('x-amzn-requestid'),
      ) if ($crc != $response->header('x-amz-crc32'));
    }

    if ( $response->status >= 300 ) {
        return $self->error_to_exception($call_object, $response);
    } else {
        return $self->response_to_object($call_object, $response);
    }
  }
 
  sub unserialize_response {
    my ($self, $response) = @_;

    return {} if (not defined $response->content or $response->content eq '');

    my $struct = eval { decode_json( $response->content ) };
    if ($@) {
      return Paws::Exception->throw(
        message => $@,
        code => 'InvalidContent',
        request_id => '',
        http_status => $response->status,
      );
    }
    return $struct;
  }

  sub error_to_exception {
    my ($self, $call_object, $response) = @_;
    
    my $struct = $self->unserialize_response( $response );
    my ($message, $request_id);

    my $code = $struct->{__type} // 'InvalidContent';
    if ($code =~ m/#/) {
      $code = (split /#/, $code)[1];
    }

    if (exists $struct->{message}){
      $message = $struct->{message} // '';
    } elsif (exists $struct->{Message}){
      $message = $struct->{Message} // '';
    } else {
      $message = $code;
    }

    $request_id = $response->header('x-amzn-requestid') // '';

    Paws::Exception->new(
      message => $message,
      code => $code,
      request_id => $request_id,
      http_status => $response->status,
    );
  }

  sub new_from_result_struct {
    my ($self, $class, $result) = @_;
    return $class->new_with_coercions($result);
  }

  sub response_to_object {
    my ($self, $call_object, $response) = @_;

    $call_object = $call_object->meta->name;

    my $returns = (defined $call_object->_returns) && ($call_object->_returns ne 'Paws::API::Response');
    my $ret_class = $returns ? $call_object->_returns : 'Paws::API::Response';
    Paws->load_class($ret_class);

    my $headers = $response->headers;
    my $request_id = $headers->{'x-amz-request-id'} || $headers->{'x-amzn-requestid'};
    # AWS has sent duplicate headers x-amx-request-id headers on some services. See issue 324 for more info
    $request_id = (ref($request_id) eq 'ARRAY') ? $request_id->[0] : $request_id;
 
    return Paws::API::Response->new(_request_id => $request_id) if (not $returns);

    my $unserialized_struct = $self->unserialize_response( $response );
    $unserialized_struct->{ _request_id } = $request_id;
    my $o_result = $self->new_from_result_struct($call_object->_returns, $unserialized_struct);
    return $o_result;
  }

1;
