# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { minimum: 2, maximun: 500 }
  validate :image, :image_size
  validates :code, presence: true, format: { with: /[a-zA-Z0-9]+\z/ }, length: { is: 7 }
  validates :price, numericality: { greater_than: 0, less_than: 9_999_999 }, length: { minimum: 1, maximun: 7 }
  validates :description, length: { minimum: 1, maximun: 5000 }

  def image_url
    super || default_image
  end

  private

  def image_size
    error.add(:image, 'should be less than 100 MB') if image.size > 100.megabytes
  end
end
