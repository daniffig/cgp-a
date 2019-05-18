class CreateFacets < ActiveRecord::Migration[5.2]
  def change
    create_table :facets do |t|
      t.string :value, null: false, index: true

      t.datetime :created_at, null: false
    end
  end
end