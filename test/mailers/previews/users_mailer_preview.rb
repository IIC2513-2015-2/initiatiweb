# Preview all emails at http://localhost:3000/rails/mailers/users_mailer
class UsersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/users_mailer/signup
  def signup
    UsersMailer.signup(User.last)
  end

end
