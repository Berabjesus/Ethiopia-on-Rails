class Article < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :title, length: { maximum: 30 }
  validates :text, length: { minimum: 10 }

  belongs_to :user, class_name: 'User', foreign_key: :AuthorId
  has_many :votes, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  mount_uploader :image, ImageUploader

  scope :top_voted, -> { order(vote_count: :desc).limit(1).first }
  scope :articles_by_user, ->(current_user_id) { where('"AuthorId" = ?', current_user_id) }
  scope :search, ->(search) { where('text LIKE ?', "%#{search}%") }
end
