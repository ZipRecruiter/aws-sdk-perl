package Paws::Net::QueryCaller;
  use Paws;
  use Moose::Role;
  use HTTP::Request::Common;
  use POSIX qw(strftime); 

  use Paws::Net::XMLResponse;

  has response_to_object => (
    is => 'ro',
    default => sub {
      Paws::Net::XMLResponse->new;
    }
  );

  # converts the objects that represent the call into parameters that the API can understand
  sub _to_querycaller_params {
    my ($self, $params) = @_;

    return %{$params->to_parameter_data};
  }

  sub generate_content_from_parameters {
    my ($self, $request) = @_;

    $request->headers->content_type('application/x-www-form-urlencoded');
    my $url = URI->new('http:');
    $url->query_form($request->parameters);
    my $content = $url->query;
    # HTML/4.01 says that line breaks are represented as "CR LF" pairs (i.e., `%0D%0A')
    $content =~ s/(?<!%0D)%0A/%0D%0A/g if (defined $content);
    return $content;
  }

  sub prepare_request_for_call {
    my ($self, $call) = @_;

    my $request = Paws::Net::APIRequest->new();

    $request->url($self->_api_endpoint . '/');
    $request->uri('/');
    $request->method('POST');

    $request->parameters({ Action => $call->_api_call, 
                           Version   => $self->version,
                           $self->_to_querycaller_params($call) 
    });

    if (not $self->does('Paws::Net::V2Signature')){
      $request->content($self->generate_content_from_parameters($request));
    }

    $self->sign($request);

    return $request;
  }
1;
