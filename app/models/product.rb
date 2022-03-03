# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum status: %i[active deleted]

  validates :name, presence: true, length: { minimum: 2, maximum: 500 }
  validate :image, :image_size
  validates :code, presence: true, format: { with: /[a-zA-Z0-9]+\z/ }, length: { is: 7 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**8) },
    format: { with: /\A\d{1,7}(\.\d{1,2})?\z/ }
  validates :description, length: { minimum: 1, maximum: 5000 }

  def image_url
    super || default_image
  end

  private

  def image_size
    error.add(:image, 'should be less than 100 MB') if image.size > 100.megabytes
  end
end
