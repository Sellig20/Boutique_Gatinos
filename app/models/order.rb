class Order < ApplicationRecord
  belongs_to :user
  has_many :flows
  has_many :items, through: :flows

  after_create :order_confirmation

  def order_confirmation
    OrderMailer.order_confirmation(self).deliver_now
  end

end
