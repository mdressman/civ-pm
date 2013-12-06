class Milestone < ActiveRecord::Base
	has_many :checkpoints, dependent: :destroy
	has_many :assets, dependent: :destroy
	belongs_to :project
	# validates :name, presence: true

    scope :with_end, where("end_date IS NOT NULL")

	before_create :set_milestone_name

	def start_time
    	end_date
  	end

  	protected

  		def set_milestone_name
            if self.milestone_type != 'Custom'
                self.name = self.milestone_type
            end
        end
end
