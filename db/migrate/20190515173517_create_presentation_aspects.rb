class CreatePresentationAspects < ActiveRecord::Migration[5.2]
  def change
    create_table :presentation_aspects do |t|

      t.timestamps
    end
  end
end
