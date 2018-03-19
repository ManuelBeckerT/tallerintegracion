class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :id
      t.string :nombre
      t.string :password

      t.timestamps
    end
  end
end
