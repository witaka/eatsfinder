class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :phone_number
      t.string :website
      t.string :address

      t.timestamps
    end
  end
end
