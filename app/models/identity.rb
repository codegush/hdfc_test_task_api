class Identity < ApplicationRecord
	belongs_to :user
	
  def self.find_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'])
  end

  def save_info(auth)
  	provider = auth[:provider]
    info = auth[:info]
    user = User.check_with_provider(auth) || User.create_with_omniauth(info)
    update(
      user: user,
      info: info.to_h
    )
  end
end