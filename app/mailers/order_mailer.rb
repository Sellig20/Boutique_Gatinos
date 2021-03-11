 class OrderMailer < ApplicationMailer
    default from: 'gustavevilgot@gmail.com'
	
	def order_confirmation(order)
		
		@user = User.find(order.user.id)

		@url = 'https://gatinos.herokuapp.com/'

		mail(to: @user.email, subject: 'Voici votre commande !')

	end
 end
