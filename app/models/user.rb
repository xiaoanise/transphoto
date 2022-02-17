class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :transphotos
  has_many :comments

  validates :nickname, presence: true
  validates :introduction, presence: true
  validates :language, presence: true
  validates :hobby, presence: true
end
