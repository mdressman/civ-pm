class Milestone < ActiveRecord::Base
	has_many :checkpoints, dependent: :destroy
	belongs_to :project
	validates :name, presence: true
end
