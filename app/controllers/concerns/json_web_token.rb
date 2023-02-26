require 'jwt'

module JsonWebToken
  extend ActiveSupport::Concern

  # File railties/lib/rails/application.rb, line 419
  # Use Rails.env.secret_key_base in development and test environments. Use ENV["SECRET_KEY_BASE"] in production
  SECRET_KEY = Rails.application.secret_key_base

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    # Use HashWithIndifferentAccess to access the hash with string or symbol keys
    HashWithIndifferentAccess.new body
  rescue
    nil
  end
end
