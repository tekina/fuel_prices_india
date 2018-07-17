class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ApiExceptions::BaseException, with: :render_error_response

  private

  def render_error_response(error)
    render json: { msg: error.msg }, status: error.http_status_code and return
  end


end
