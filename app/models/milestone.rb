class Milestone < ActiveRecord::Base
	has_many :checkpoints, dependent: :destroy
	has_many :assets, dependent: :destroy
	belongs_to :project
	validates :name, presence: true
end
