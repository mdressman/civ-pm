class AddFieldsToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :start_date, :datetime
  	add_column :projects, :team, :string
  end
end
