FactoryBot.define do
  factory :product do
    name { Faker::Device.model_name }
    image { Faker::File.file_name(ext: 'jpg') }
    code { Faker::Alphanumeric.alphanumeric(number: 7) }
    price { Faker::Number.number(digits: 7) }
    description { Faker::Lorem.paragraph_by_chars(number: 1000) }
  end
end