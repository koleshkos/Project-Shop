# frozen_string_literal: true

30.times do |_product|
  Product.create(
    name: Faker::Device.model_name,
    image: Faker::File.file_name(ext: 'jpg'),
    code: Faker::Lorem.characters(number: 7),
    price: Faker::Number.number(digits: 7),
    description: Faker::Lorem.paragraph_by_chars(number: 1000),
    status: 'active',
  )
end
