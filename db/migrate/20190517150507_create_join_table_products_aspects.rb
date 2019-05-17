class CreateJoinTableProductsAspects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :aspects, table_name: :products_aspects do |t|
      t.references :product, foreign_key: true, null: false, index: { name: :product_id}
      t.references :aspect, foreign_key: true, null: false, index: { name: :aspect_id}

      t.timestamps
    end
  end
end
