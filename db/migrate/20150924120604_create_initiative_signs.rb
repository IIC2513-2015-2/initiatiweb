class CreateInitiativeSigns < ActiveRecord::Migration
  def change
    create_table :initiative_signs do |t|
      t.text :message
      t.references :user, index: true, foreign_key: true, null: false
      t.references :initiative, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :initiative_signs, [:user_id, :initiative_id], unique: true
  end
end
