class Api::External::LinksController < Api::External::ApplicationController

  before_action :validate_url_link_valid!, only: [:encode, :decode]

  def encode
    validate_url_link_valid!

    result = EncodeUrl.new(request).generate
    return render_data(result)
  end

  def decode
    validate_url_link_valid!

    result = DecodeUrl.new(request).generate
    return render_data(result)
  end

  private

  def validate_url_link_valid!
    link = request.params[:original_url] || request.params[:short_url]

    return render_error_json(message: 'param is empty') if link.blank?

    # return render_error_json(message: 'URL is invalid') unless isValidURL?(link)
  end

  def isValidURL?(link)
    pattern = Link::URL_PATTERN
    !!(link =~ pattern)
  end
end
