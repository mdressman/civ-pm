class AddPhaseToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :phase, :string
  end
end
