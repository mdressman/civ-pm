class AddTypeToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :milestone_type, :string
    add_index :milestones, :milestone_type
  end
end
