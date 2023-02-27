class DecodeUrl

  def initialize(request)
    @request = request
    @short_url = request.params[:short_url]
  end

  def generate
    link = Link.find_by(short_url: @short_url)

    if link
      return LinkHelper.generate_data(link)
    else
      return LinkHelper.generate_error('There is no short url in database')
    end
  end
end
