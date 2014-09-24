class User < ActiveRecord::Base

	validates :login,  presence: true, length: { maximum: 16 }
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
 	validates :password, presence: true, length: { maximum: 16 }

	before_save { self.email = email.downcase }

end