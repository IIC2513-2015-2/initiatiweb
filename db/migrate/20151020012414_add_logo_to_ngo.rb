class AddLogoToNgo < ActiveRecord::Migration
  def change
    add_attachment :ngos, :logo
  end
end
