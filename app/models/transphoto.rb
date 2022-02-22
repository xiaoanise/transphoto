class Transphoto < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :title, presence: true
  validates :from_to, presence: true
  validates :message, presence: true
  validates :image, presence: true
end
