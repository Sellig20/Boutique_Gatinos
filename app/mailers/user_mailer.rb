class UserMailer < ApplicationMailer

	default from: 'gustavevilgot@gmail.com'
	
	def welcome(user)
		
		@user = user	

		@url = 'site.fr'

		mail(to : @user.email, subject: 'Bienvenue !')

	end

end
