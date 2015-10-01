class Initiative < ActiveRecord::Base
  belongs_to :ngo
  has_many :signs, class_name: 'InitiativeSign'
  validates :title, presence: true

  def self.random_initiatives(quantity = 5)
    self.order('RANDOM()').limit(quantity)
  end

end
