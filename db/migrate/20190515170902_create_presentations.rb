class CreatePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.belongs_to :product, null: false

      t.timestamps
    end
  end
end
