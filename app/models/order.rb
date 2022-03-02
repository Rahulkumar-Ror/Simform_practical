class Order < ApplicationRecord
  validates :quantity, presence: true
  belongs_to :product
end
