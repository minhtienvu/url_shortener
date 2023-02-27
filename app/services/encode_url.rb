class EncodeUrl

  def initialize(request)
    @request = request
    @original_url = request.params[:original_url]
  end

  def generate
    result = Link.find_by(original_url: @original_url)
    return LinkHelper.generate_data(result) if result

    short_url = generate_full_short_url
    expiration_date = generate_expiration_date

    result = Link.new(original_url: @original_url, short_url: short_url, expiration_date: expiration_date)

    if result.save
      LinkHelper.generate_data(result)
    else
      LinkHelper.generate_error('Creating short link unsuccessfully!')
    end
  end

  private

  def generate_hash
     # SecureRandom.base58 generates a random base58 string(a-z, A-Z, 0-9)
    SecureRandom.base58(6)
  end

  def generate_expiration_date
    Time.current + 30.days
  end

  def generate_full_short_url
    "#{@request.base_url}/#{generate_hash}"
  end
end
