class CreateDescribableFacets < ActiveRecord::Migration[5.2]
  def change
    create_table :describable_facets, id: false do |t|
      t.string :describable_type, null: false, index: true
      t.integer :describable_id, null: false, index: true
      t.belongs_to :facet, null: false, index: true

      t.datetime :created_at, null: false
    end

    add_index :describable_facets, [:describable_type, :describable_id], name: 'index_describable_facets_on_describable'
    add_index :describable_facets, [:describable_type, :describable_id, :facet_id], unique: true, name: 'index_describable_facets_on_describable_facet'
  end
end