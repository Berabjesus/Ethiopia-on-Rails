class Category < ApplicationRecord
  has_many :tags
  has_many :articles, through: :tags

  scope :top_voted, ->(category) { find(category.id).articles.order(vote_count: :desc).limit(1).first }

  scope :top_priority, ->(limit = nil) { all.order(priority: :desc).limit(limit) }

end
