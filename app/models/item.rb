class Item < ApplicationRecord

  validates :title, :description, :price, :image_url, presence: true
  validates :title, length: { in: 3..100 }
  validates :description, length: { in: 5..500 }
  validates :price, numericality: { greater_than: 0.0 }

  has_many :bills
  has_many :carts, through: :bills

  has_many :flows
  has_many :orders, through: :flows
  has_one_attached :picture
end
