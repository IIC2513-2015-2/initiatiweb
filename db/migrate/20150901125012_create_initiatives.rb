class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      t.boolean :active, default: false
      t.string :hashtag
      t.references :ngo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
