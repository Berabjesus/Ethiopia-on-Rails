class Article < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :title, length: { maximum: 30 }
  validates :text, length: { minimum: 10 }

  belongs_to :user, class_name: "User", foreign_key: :AuthorId
  has_many :votes
  has_many :tags
  has_many :categories, through: :tags
  mount_uploader :image, ImageUploader

  scope :top_voted, -> { order(vote_count: :desc).limit(1).first }
end
