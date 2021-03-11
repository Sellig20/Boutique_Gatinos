class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

    after_create :order_confirmation

    
    def admin_confirmation
      OrderMailer.admin_confirmation(self).deliver_now
    end
      
end
