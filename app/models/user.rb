class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image, destroy: false

  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :email, presence: true
end
