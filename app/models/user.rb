class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 3 }

  def generate_auth_token
    payload = { user_id: self.id }
    AuthToken.encode(payload)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email.downcase)
    user = @user.present? ? @user : nil
  end
end
