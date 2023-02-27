module LinkHelper
  def self.generate_data(object)
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
end
