class Ngo < ActiveRecord::Base
  has_many :initiatives
  has_and_belongs_to_many :users
  validates :name, presence: true
  validates :email, presence: true
  validates :webpage, presence: true
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path('placeholder.gif')
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def last_initiatives(quantity = 5)
    initiatives.order('id DESC').limit(quantity)
  end

end
