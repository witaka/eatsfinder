class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :dish_type
      t.string :description
      t.string :price
      t.belongs_to :provider, foreign_key: true

      t.timestamps
    end
  end
end
