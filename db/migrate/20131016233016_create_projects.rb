class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.string :name
      t.string :project_number
      t.string :project_type
      t.datetime :start_date
      t.datetime :end_date
      t.float :total_time_spent
      t.string :notes
      t.index :project_type
      t.timestamps
    end
  end
end
