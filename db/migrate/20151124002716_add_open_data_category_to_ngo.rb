class AddOpenDataCategoryToNgo < ActiveRecord::Migration
  def change
    add_column :ngos, :open_data_category, :string
  end
end
