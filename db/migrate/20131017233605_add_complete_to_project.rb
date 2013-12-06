class AddCompleteToProject < ActiveRecord::Migration
  def change
    add_column :projects, :complete, :boolean, :default => false
  end
end
