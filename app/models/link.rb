class Link < ApplicationRecord
  validates_presence_of :original_url
  validates :original_url, :short_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates_uniqueness_of :short_url
end
