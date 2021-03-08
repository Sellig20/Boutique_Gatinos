class UserMailer < ApplicationMailer

	default from: 'gustavevilgot@gmail.com'
	
	def welcome(user)
		
		@user = user	

		@url = 'https://gatinos.herokuapp.com/'

		mail(to: @user.email, subject: 'Bienvenue !')

	end

end
