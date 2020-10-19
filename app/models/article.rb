class Article < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :AuthorId
  mount_uploader :image, ImageUploader
end
