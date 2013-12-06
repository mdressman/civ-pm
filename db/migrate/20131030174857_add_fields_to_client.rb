class AddFieldsToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :start_date, :datetime
  	add_column :clients, :team, :string
  end
end
