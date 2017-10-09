class User < ApplicationRecord
   has_secure_password
   validates :password, :length => {:minimum => 5}
   validates :username, :email, presence: true, uniqueness: true
   has_many :rounds


end
