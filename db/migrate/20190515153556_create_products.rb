class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :brand, null: false

      t.string :name
      t.string :ean_code, limit: 13

      t.timestamps
    end
  end
end
