class DecodeUrl

  def initialize(request)
    @request = request
    @short_url = request.params[:short_url]
  end

  def generate
    short_link = get_short_link_from_hash
    link = Link.find_by(short_url: short_link)

    if link
      return GenerateResponse.generate_object(link, 'Decoding short link successfully!')
    else
      return GenerateResponse.generate_error('There is no short url in database')
    end
  end

  private

  def get_short_link_from_hash
    hash = @short_url.split('/').last
    full_domain_path = @request.env['rack.url_scheme'] + '://' + @request.host_with_port
    "#{full_domain_path}/#{hash}"
  end
end
