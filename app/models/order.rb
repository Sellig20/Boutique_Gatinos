class Order < ApplicationRecord
  belongs_to :user
  has_many :flows
  has_many :items, through: :flows

  


end
