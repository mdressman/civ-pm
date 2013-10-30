class AddCompleteToCheckpoint < ActiveRecord::Migration
  def change
    add_column :checkpoints, :complete, :boolean, :default => false
  end
end
