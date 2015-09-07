class CreateNgosUsers < ActiveRecord::Migration
  def change
    create_table :ngos_users, id: false do |t|
      t.references :ngo, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
    add_index :ngos_users, [:ngo_id, :user_id], unique: true
  end
end
