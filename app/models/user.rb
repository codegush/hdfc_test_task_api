class User < ApplicationRecord
  has_secure_password

  has_many :identities

  validates :email, uniqueness: true, allow_nil: true,  format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  
  validates :password, confirmation: true 
  validates :password_confirmation, presence: true
  validate :email_xor_username

  def self.create_with_omniauth(user_info)
    password = SecureRandom.hex(8)
    create(
      email: user_info['email'],
      username: user_info['nickname'],
      password: password,
      password_confirmation: password
    )
  end

  def self.check_with_provider(auth)
    info = auth[:info]
    User.find_by_email(info[:email]) if info[:email]
  end

  def email_xor_username
    if [self.email, self.username].reject(&:blank?).size == 0
      errors[:base] << ("Neither email nor username is present.")
    end
  end

  def self.id_exists?(email)
    User
    .joins(:identities)
    .where("users.email=? and identities.provider=?", email, 'identity')
    .count != 0
  end

  def self.save_by_identity(auth)
    user = find_or_initialize_by(email: auth[:email]) do |u|
      u.password = auth[:password]
      u.password_confirmation = auth[:password_confirmation]
    end
  end
end
