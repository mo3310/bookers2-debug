class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :introduction, length: { maximum: 50 }
  validates :name, presence: true, length: { in: 2..20 }, uniqueness: true
  validates :email, presence: true
end
