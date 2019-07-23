package Paws::Net::JsonCaller;
  use Paws;
  use Moose::Role;
  use JSON::MaybeXS;
  use POSIX qw(strftime);
  requires 'json_version';

  use Paws::Net::JsonResponse;

  has response_to_object => (
    is => 'ro',
    default => sub {
      Paws::Net::JsonResponse->new;
    }
  );

  sub prepare_request_for_call {
    my ($self, $call) = @_;

    my $request = Paws::Net::APIRequest->new();

    $request->url($self->_api_endpoint . '/');
    $request->uri('/');
    $request->method('POST');

    my @time = gmtime;
    $request->parameters({ Action => $call->_api_call,
                           Version => $self->version,
                           AWSAccessKeyId => $self->access_key,
                           Timestamp => strftime("%Y-%m-%dT%H:%M:%SZ",@time),
                        });
    $request->header('X-Amz-Target', sprintf('%s.%s', $self->target_prefix, $call->_api_call));

    my $j_version = $self->json_version;
    $request->headers->content_type("application/x-amz-json-$j_version");

    #$request->header('Content-Encoding', 'amz-1.0');
    $request->header( 'X-Amz-Date' => strftime( '%Y%m%dT%H%M%SZ', @time ) );
    $request->header( Host => $self->endpoint_host );

    $request->content(encode_json($call->to_json_data));

    $self->sign($request);

    return $request;
  }
1;
