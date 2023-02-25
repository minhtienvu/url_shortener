class EncodeUrl

  def initialize(request)
    @request = request
    @original_url = request.params[:original_url]
  end

  def generate
    link = Link.find_by(original_url: @original_url)
    return GenerateResponse.generate_object(link, 'Link is shortened') if link

    short_url = generate_short_url(generate_hash)
    expiration_date = generate_expiration_date

    link = Link.new(original_url: @original_url, short_url: short_url, expiration_date: expiration_date)

    if link.save
      GenerateResponse.generate_object(link, 'Creating short link successfully!')
    else
      GenerateResponse.generate_error('Creating short link unsuccessfully!')
    end
  end

  private

  def generate_hash
     # SecureRandom.base58 generates a random base58 string.
    SecureRandom.base58(6)
  end

  def generate_expiration_date
    Time.current + 30.days
  end

  def generate_short_url(hash)
    full_domain_path = @request.env['rack.url_scheme'] + '://' + @request.host_with_port
    "#{full_domain_path}/#{hash}"
  end
end
