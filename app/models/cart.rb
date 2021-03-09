class Cart < ApplicationRecord
  belongs_to :user
  has_many :bills
  has_many :items, through: :bills
end
