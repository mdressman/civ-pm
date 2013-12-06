class ProjectMailer < ActionMailer::Base
	default from: "matt@wearecivilized.us"

	ActionMailer::Base.default_url_options[:host] = "localhost:3000"

	def notification_email(user, project)
		@user = user
		@project = project
		mail(to: @user.email, subject: "Project Notification")
	end

end
