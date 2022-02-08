# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { Product.new(name: 'Product', image: 'product.jpg', code: '12345RE', price: 1000, description: 'My Product') }
  before { subject.save }

  context 'validation correct name value' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should be longer' do
      subject.name = Faker::Name.initials(number: 1)
      expect(subject).to_not be_valid
    end
  end

  context 'validation correct code value' do
    it 'code should be present' do
      subject.code = nil
      expect(subject).to_not be_valid
    end

    it 'code should not have symbol' do
      subject.code = '1#3456&'
      expect(subject).to_not be_valid
    end

    it 'code should be contain the correct number of characters' do
      subject.code = Faker::Number.number(digits: 8)
      expect(subject).to_not be_valid
    end

    it 'code should be contain the correct number of characters' do
      subject.code = Faker::Number.number(digits: 6)
      expect(subject).to_not be_valid
    end
  end

  context 'validation correct price value' do
    it 'price should be present' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'price should be contain the correct number of characters' do
      subject.price = Faker::Number.number(digits: 8)
      expect(subject).to_not be_valid
    end

    it 'price should be contain the correct number of characters' do
      subject.price = Faker::Number.decimal(l_digits: 8, r_digits: 1)
      expect(subject).to_not be_valid
    end
  end

  context 'validation correct image value' do
    it 'image may not be present' do
      subject.image = nil
      expect(subject).to be_valid
    end
  end

  context 'validation correct decription value' do
    it 'description should be present' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'description should be contain the correct number of characters' do
      subject.description = Faker::Lorem.paragraph_by_chars(number: 5001)
      expect(subject).to_not be_valid
    end
  end
end
