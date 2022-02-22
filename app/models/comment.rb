class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :transphoto

  validates :content, presence: true
end
