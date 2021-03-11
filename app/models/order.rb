class Order < ApplicationRecord
  belongs_to :user
  has_many :flows
  has_many :items, through: :flows

  after_create :order_confirmation


end
