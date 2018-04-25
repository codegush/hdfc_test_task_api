class User < ApplicationRecord
  has_secure_password

  has_many :identities

  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, confirmation: true 
  validates :password_confirmation, presence: true

  def self.create_with_omniauth(info)
    create(
      name: info['name'],
      first_name: info['first_name'],
      last_name: info['last_name'],
      image: info['image'],
      url: info['urls'].first[1],
      password: '123',
      password_confirmation: '123'
    )
  end
end
