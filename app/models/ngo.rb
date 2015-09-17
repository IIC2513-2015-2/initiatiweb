class Ngo < ActiveRecord::Base
  has_many :initiatives
  has_and_belongs_to_many :users
  validates :name, presence: true
  validates :logo, presence: true
  validates :email, presence: true
  validates :webpage, presence: true

  def last_initiatives(quantity = 5)
    initiatives.order('id DESC').limit(quantity)
  end

end
