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
		milestones = Milestone.with_end.all
		checkpoints = Checkpoint.with_end.all
		@events = milestones + checkpoints
	end
  
end
