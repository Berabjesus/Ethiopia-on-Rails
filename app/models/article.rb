class Article < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :AuthorId
  has_many :votes
  has_many :tags
  has_many :categories, through: :tags
  mount_uploader :image, ImageUploader
end
