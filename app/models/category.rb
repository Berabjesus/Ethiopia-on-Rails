class Category < ApplicationRecord
  has_many :tags
  has_many :articles, through: :tags

  scope :most_recent, ->(category) { find(category.id).articles.order(created_at: :desc).limit(1).first }

  scope :top_priority, ->(limit = nil) { all.order(priority: :desc).limit(limit) }
end
