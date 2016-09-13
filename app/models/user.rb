class User < ApplicationRecord
  before_save { self.name = name.downcase }
  validates :name, presence: true, 
                   uniqueness: true
  validates :password, presence: true,
                       length: { minimum: 6 }
  validates :level, presence: true
  has_secure_password
end
