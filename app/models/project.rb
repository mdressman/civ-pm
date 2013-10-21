class Project < ActiveRecord::Base
	has_many :milestones, dependent: :destroy
	validates :name, presence: true
end
