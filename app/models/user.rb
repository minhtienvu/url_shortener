class User < ApplicationRecord
  # require 'securerandom'

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true
end
