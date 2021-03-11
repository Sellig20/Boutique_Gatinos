class AdminMailer < ApplicationMailer
    default from: 'gustavevilgot@gmail.com'
	
	def welcome(admin_user)
		
		@admin_user = admin_user	

		@url = 'https://gatinos.herokuapp.com/'

		mail(to: @admin_user.email, subject: 'test !')

	end
end

