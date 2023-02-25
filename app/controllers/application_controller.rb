class ApplicationController < ActionController::Base
  ## Temporarily turn off CSRF protection to call from POSTMAN
  skip_before_action :verify_authenticity_token
end
