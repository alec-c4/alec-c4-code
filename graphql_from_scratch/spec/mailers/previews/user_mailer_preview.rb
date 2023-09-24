# Preview all emails at http://localhost:3000/rails/mailers/user
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user/confirmation
  def confirmation
    UserMailer.confirmation(User.first || FactoryBot.create(:user, email: "to@example.org"), "confirmation-token-0123456789")
  end
end
