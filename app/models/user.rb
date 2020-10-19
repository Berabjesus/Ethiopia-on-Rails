class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true, presence: true
  has_many :articles, :foreign_key => "AuthorId", :class_name => "Article",  dependent: :destroy
end
