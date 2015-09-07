class Ngo < ActiveRecord::Base
  has_many :initiatives
  has_and_belongs_to_many :users
end
