class Customer < ApplicationRecord
  validates :first_name, :last_name, :phone_number, :email, presence: true
	validates :email, uniqueness: true
	validates :phone_number, length: { is: 10 }
end
