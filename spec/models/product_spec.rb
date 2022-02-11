# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validation correct name value' do
    product = FactoryBot.build(:product)

    it 'name should be present' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'name should be longer' do
      product.name = Faker::Name.initials(number: 1)
      expect(product).to_not be_valid
    end
  end

  describe 'validation correct code value' do
    product = FactoryBot.build(:product)

    it 'code should be present' do
      product.code = nil
      expect(product).to_not be_valid
    end

    it 'code should not have symbol' do
      product.code = "#{Faker::Lorem.characters(number: 6)}#"
      expect(product).to_not be_valid
    end

    it 'code should be contain the correct number of characters' do
      product.code = Faker::Alphanumeric.alphanumeric(number: 8)
      expect(product).to_not be_valid
    end

    it 'code should be contain the correct number of characters' do
      product.code = Faker::Alphanumeric.alphanumeric(number: 6)
      expect(product).to_not be_valid
    end
  end

  describe 'validation correct price value' do
    product = FactoryBot.build(:product)

    it 'price should be present' do
      product.price = nil
      expect(product).to_not be_valid
    end

    it 'price should be contain the correct number of characters' do
      product.price = Faker::Number.number(digits: 8)
      expect(product).to_not be_valid
    end

    it 'price should be contain the correct number of characters' do
      product.price = Faker::Number.decimal(l_digits: 8, r_digits: 1)
      expect(product).to_not be_valid
    end
  end

  describe 'validation correct image value' do
    product = FactoryBot.create(:product)

    it 'image may not be present' do
      product.image = nil
      expect(product).to be_valid
    end
  end

  describe 'validation correct decription value' do
    product = FactoryBot.build(:product)
    it 'description should be present' do
      product.description = nil
      expect(product).to_not be_valid
    end

    it 'description should be contain the correct number of characters' do
      product.description = Faker::Lorem.paragraph_by_chars(number: 5001)
      expect(product).to_not be_valid
    end
  end
end
