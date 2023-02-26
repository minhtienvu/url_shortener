class Api::External::ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  def render_data(data, message)
    render json: {
      message: message,
      data: data
    }
  end

  def render_error_json(message)
    render json: {
      message: message
    }
  end

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    return render json: { error: 'Permission denied!!' } unless decoded
  end
end
