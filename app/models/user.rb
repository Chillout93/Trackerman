class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password
  
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 200 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
end

