# frozen_string_literal: true

class ChangeTypeForPrice < ActiveRecord::Migration[6.1]
  def up
    change_table :products do |t|
      t.change :price, :decimal, precision: 9, scale: 2
    end
  end

  def down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
