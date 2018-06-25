class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, index: {unique: true}
      t.string :full_name
      t.string :email, index: {unique: true}  
      t.string :password_digest
      t.boolean :food_provider, default: false
      t.boolean :admin, default: false
      
      t.timestamps
    end
  end
end


