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
		projects = Project.with_end.all
		milestones = Milestone.with_estimated_date.all
		@events = projects + milestones
	end
  
end
