class Article < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :AuthorId
end
