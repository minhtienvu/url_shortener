module RedirectRouteHelper
  def self.redirect(params, request)
    link = Link.find_by(short_url: request.original_url)
    link ? link.original_url : request.original_url
  end
end
