class User < ActiveRecord::Base
  has_secure_password

  has_many :contacts

  validates :email, :number, :password_digest, :presence => true

  validates_uniqueness_of :email

end
