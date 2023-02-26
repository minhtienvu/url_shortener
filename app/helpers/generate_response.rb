module GenerateResponse
  def self.generate_object(object)
    {
      original_url: object.original_url,
      short_url: object.short_url,
      expiration_date: object.expiration_date
    }
  end

  def self.generate_error(message)
    {
      message: message || 'Something wrong!'
    }
  end

  def self.generate_short_url(hash)
    full_domain_path = request.env['rack.url_scheme'] + '://' + request.host_with_port
    "#{full_domain_path}/#{hash}"
  end
end
