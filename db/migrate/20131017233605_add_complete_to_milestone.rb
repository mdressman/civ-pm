class AddCompleteToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :complete, :boolean, :default => false
  end
end
