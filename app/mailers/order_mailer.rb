class OrderMailer < ApplicationMailer

	default from: 'gustavevilgot@gmail.com'
	
	def user_confirmation(user)
		
		@user = user
		# @order = order
		
  #   	@user = User.find_by(order.user_id)
  #   	@cart = Cart.find_by(user_id: @user.id)

		# @user = current_user

		# @cart = Cart.find_by(user_id: @user.id)

		@url = 'https://gatinos.herokuapp.com/'

		mail(to: @user.email, subject: 'Confirmation de commande.')

	end

end
