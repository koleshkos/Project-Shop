# frozen_string_literal: true

class RemoveImagesFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :images, :json
  end
end
