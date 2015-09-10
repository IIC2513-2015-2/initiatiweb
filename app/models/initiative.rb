class Initiative < ActiveRecord::Base
  belongs_to :ngo

  validates :title, presence: true
end
