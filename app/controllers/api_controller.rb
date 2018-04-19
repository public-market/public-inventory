class ApiController < ActionController::API
  include JSONAPI::ActsAsResourceController

  def base_url
    @base_url ||= [request.protocol, request.host_with_port, ENV['API_SCOPE']].compact.join
  end
end
