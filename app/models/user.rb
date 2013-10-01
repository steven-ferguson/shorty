class User < ActiveRecord::Base
  has_many :urls
  validates :email, presence: true

  has_secure_password
end