class CreateProductAspects < ActiveRecord::Migration[5.2]
  def change
    create_table :product_aspects do |t|

      t.timestamps
    end
  end
end
