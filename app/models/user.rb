class User < ActiveRecord::Base
  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true
  validates :password, presence: true
  # TODO: validación de formato de e-mail bien primitiva por el momento...
  validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]{1,5}\z/

end
