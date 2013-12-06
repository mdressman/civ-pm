class Checkpoint < ActiveRecord::Base
	belongs_to :milestone

	# after_create :send_email

	scope :with_end, where("end_date IS NOT NULL")

	def start_time
    	end_date
  	end

  	def send_email
	    if self.user_id
	        ProjectMailer.notification_email(User.find(self.user_id), Project.find(self.project_id)).deliver
	    end
	end
end
