class Api::External::LinksController < Api::External::ApplicationController

  before_action :authenticate_request!, only: [:encode, :decode]

  before_action :validate_url_link_valid!

  def encode
    result = EncodeUrl.new(request).generate

    if result[:short_url]
      return render_data(result, 'Encode url successfully!')
    else
      return render_error(result[:message])
    end
  end

  def decode
    result = DecodeUrl.new(request).generate

    if result[:original_url]
      return render_data(result, 'Decode url successfully!')
    else
      return render_error(result[:message])
    end
  end

  private

  def validate_url_link_valid!
    url_param = request.params[:original_url] || request.params[:short_url]

    return render_error('param is empty') if url_param.blank?
  end
end
