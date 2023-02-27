FactoryBot.define do
  factory :link do
    original_url { Faker::Internet.url }
    short_url { "http://localhost:3000/#{SecureRandom.base58(6)}" }
    expiration_date { Time.current + 30.days }
  end
end
