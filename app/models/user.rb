class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true, presence: true
end
