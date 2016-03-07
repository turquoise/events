class User < ActiveRecord::Base
	has_many :registrations, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :liked_events, through: :likes, source: :event

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: {cse_sensitive: false}

  def self.authenticate(email_or_username, password)
  	user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
  	user && user.authenticate(password)
  end
end
