class Order < ApplicationRecord
  belongs_to :user
  has_many :flows
  has_many :items, through: :flows

  

  def order_confirmation
    OrderMailer.order_confirmation(self).deliver_now
  end

end
