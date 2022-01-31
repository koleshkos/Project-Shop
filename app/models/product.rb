# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
end
