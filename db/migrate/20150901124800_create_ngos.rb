class CreateNgos < ActiveRecord::Migration
  def change
    create_table :ngos do |t|
      t.string :name, null: false
      t.string :logo
      t.string :email
      t.text :description
      t.string :webpage

      t.timestamps null: false
    end
    add_index :ngos, :name
  end
end
