class BaseController < ApplicationController

  def render_data(data)
    render json: {
      data: data
    }
  end

  def render_error_json(message:)
    render json: {
      message: message
    }
  end
end