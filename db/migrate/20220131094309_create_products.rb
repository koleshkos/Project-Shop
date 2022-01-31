class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :code
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
