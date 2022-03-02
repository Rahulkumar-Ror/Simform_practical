class Product < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5, maximum: 300 }
  validates :price, presence: true
  has_many :orders, dependent: :destroy
end
