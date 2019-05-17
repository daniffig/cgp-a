class CreateAspects < ActiveRecord::Migration[5.2]
  def change
    create_table :aspects do |t|
      t.string :type, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
