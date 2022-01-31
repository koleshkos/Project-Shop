# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {minimum: 2, maximun: 500}
  validates :code, presence: true, format: { with: /[a-zA-Z0-9]+\z/ }, length: { is: 7 }
  validates :price, numericality: { greater_than: 0, less_than: 1000000 }, length: {minimum: 2, maximun: 500}
  validates :description, length: {minimum: 1, maximun: 5000}
end
