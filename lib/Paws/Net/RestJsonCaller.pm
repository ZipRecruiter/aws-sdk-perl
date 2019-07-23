package Paws::Net::RestJsonCaller;
  use Paws;
  use Moose::Role;
  use HTTP::Request::Common;
  use POSIX qw(strftime); 
  use URI::Template;
  use JSON::MaybeXS;

  use Paws::Net::RestJsonResponse;

  has response_to_object => (
    is => 'ro',
    default => sub {
      Paws::Net::RestJsonResponse->new;
    }
  );

  sub _call_uri {
    my ($self, $call) = @_;
    my $uri_template = $call->meta->name->_api_uri;
    my $t = URI::Template->new( $uri_template );

    my $vars = $call->to_uri_data;
    my $uri = $t->process($vars);
    return $uri;
  }

  sub _to_header_params {
    my ($self, $request, $call) = @_;
    my $data = $call->to_header_data;
    for my $key (keys %$data) {
      my $val = $data->{$key};
      $request->header($key => $val);
    }
  }

  sub prepare_request_for_call {
    my ($self, $call) = @_;

    my $request = Paws::Net::APIRequest->new();

    my $uri = $self->_call_uri($call);

    my $qparams = { $uri->query_form, %{$call->to_query_data} };
    $uri->query_form(%$qparams);

    $request->uri($uri->as_string);
    my $url = $self->_api_endpoint . $uri->as_string;
    $request->url($url);

    $self->_to_header_params($request, $call);
    $request->content($call->to_body_data);
    $request->method($call->_api_method);

    $self->sign($request);

    return $request;
  }
1;
