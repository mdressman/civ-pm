class AddTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_type, :string
    add_index :projects, :project_type
  end
end
