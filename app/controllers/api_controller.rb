class ApiController < ActionController::API
  include JSONAPI::Utils

  rescue_from ActiveRecord::RecordNotFound, with: :jsonapi_render_not_found

  private

  def jsonapi_render_not_found(_exception)
    jsonapi_render_errors(JSONAPI::Exceptions::RecordNotFound.new(params[:id]))
  end
end
