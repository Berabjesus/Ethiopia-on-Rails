class Article < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :title, length: { maximum: 30 }
  validates :text, length: { minimum: 10 }

  belongs_to :user, class_name: "User", foreign_key: :AuthorId
  has_many :votes
  has_one :tag
  has_one :category, through: :tag
  mount_uploader :image, ImageUploader
end
