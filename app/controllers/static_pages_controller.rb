class StaticPagesController < ApplicationController
	def home
	end
	
	def help
	end

	def about
	end
	  
	def contact
	end	

	def calendar
		milestones = Milestone.all
		checkpoints = Checkpoint.all
		@events = milestones + checkpoints
	end
  
end
