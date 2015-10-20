class User < ActiveRecord::Base
  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true
  # TODO: validación de formato de e-mail bien primitiva por el momento...
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9\._+-]+@[a-z0-9\._-]+\.[a-z]{1,5}\z/

  has_secure_password

  before_create :generate_validation_token

  private

  def generate_validation_token
    self.validation_token = SecureRandom.urlsafe_base64(50)
  end

end
