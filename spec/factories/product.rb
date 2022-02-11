# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Device.model_name }
    image { Faker::File.file_name(ext: 'jpg') }
    code { Faker::Lorem.characters(number: 7) }
    price { Faker::Number.number(digits: 7) }
    description { Faker::Lorem.paragraph_by_chars(number: 1000) }

    trait :invalid_params do
      name { Faker::Name.initials(number: 1) }
      image { Faker::File.file_name(ext: 'mp3') }
      code { Faker::Alphanumeric.alphanumeric(number: 8) }
      price { Faker::Number.negative }
      description { Faker::Lorem.paragraph_by_chars(number: 6000) }
    end
  end
end
