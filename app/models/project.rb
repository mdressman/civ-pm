class Project < ActiveRecord::Base
    has_many :milestones, -> { order "position ASC" }, dependent: :destroy
	has_many :assets, dependent: :destroy
	belongs_to :client
	# validates :name, presence: true

    scope :with_end, where("end_date IS NOT NULL")

	before_create :set_project_name

	def start_time
        end_date
    end

    protected

		def set_project_name
            if self.project_type != 'Custom'
                self.name = self.project_type
            end
        end
end
