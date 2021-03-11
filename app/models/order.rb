class Order < ApplicationRecord
  belongs_to :user
  has_many :flows
  has_many :items, through: :flows

  after_create:order_confirmation_send

  def order_confirmation_send
    OrderMailer.order_confirmation(self).deliver_now
  end

end
