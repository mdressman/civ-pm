class AddProjectIdToCheckpoint < ActiveRecord::Migration
  def change
  	add_column :checkpoints, :project_id, :integer
  	add_index :checkpoints, :project_id 
  end
end
