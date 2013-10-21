class AddStatusToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :status, :boolean
  end
end
