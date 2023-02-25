class Link < ApplicationRecord
  validates_presence_of :original_url
  validates :original_url, :short_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates_uniqueness_of :short_url

  ## Need to be considered
  URL_PATTERN = /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]
  +[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]
  \.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|w
  ww\.[a-zA-Z0-9]+\.[^\s]{2,})/
end
