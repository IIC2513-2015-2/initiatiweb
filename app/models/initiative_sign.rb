class InitiativeSign < ActiveRecord::Base
  belongs_to :user
  belongs_to :initiative

  def self.of_user(user_id)
    find_by(user_id: user_id)
  end

end
