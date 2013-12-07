class Milestone < ActiveRecord::Base
	belongs_to :project

	# after_create :send_email

	scope :with_estimated_date, where("estimated_date IS NOT NULL")

	def start_time
    	estimated_date
  	end

	# def send_email
	#     if self.user_id
	#         ProjectMailer.notification_email(User.find(self.user_id), Project.find(self.project_id)).deliver
	#     end
	# end
end
