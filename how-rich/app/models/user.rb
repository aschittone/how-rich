class User < ApplicationRecord
  has_many :searches
  has_many :stocks, through: :searches
  has_secure_password

end
