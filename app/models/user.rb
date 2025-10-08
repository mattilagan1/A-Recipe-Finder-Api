class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  has_many :recipes, through: :favorites
  validates :email, presence: true, uniqueness: true
end
