class Checkpoint < ActiveRecord::Base
	belongs_to :milestone

	def start_time
    	end_date
  	end
end
