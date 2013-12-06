class AddClientIdToMilestone < ActiveRecord::Migration
  def change
  	add_column :milestones, :client_id, :integer
  	add_index :milestones, :client_id 
  end
end
