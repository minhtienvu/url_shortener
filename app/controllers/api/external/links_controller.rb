class Api::External::LinksController < Api::External::ApplicationController

  before_action :authenticate_request, only: [:encode, :decode]

  before_action :validate_url_link_valid

  def encode
    result = EncodeUrl.new(request).generate
    return render_data(result, 'Encode url successfully!')
  end

  def decode
    result = DecodeUrl.new(request).generate
    return render_data(result, 'Decode url successfully!')
  end

  private

  def validate_url_link_valid
    url_param = request.params[:original_url] || request.params[:short_url]

    return render_error_json('param is empty') if url_param.blank?
  end
end
