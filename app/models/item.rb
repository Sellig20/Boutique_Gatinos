class Item < ApplicationRecord

  validates :title, :description, :price, :image_url, presence: true
  validates :title, length: { in: 3..100 }
  validates :description, length: { in: 5..500 }
  validates :price, numericality: { greater_than: 0.0 }
end