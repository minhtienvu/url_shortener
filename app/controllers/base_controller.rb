class BaseController < ApplicationController

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
end
