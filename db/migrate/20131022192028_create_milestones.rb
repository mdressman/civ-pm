class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.datetime :estimated_date
      t.datetime :actual_date
      t.float :estimated_time
      t.float :actual_time
      t.string :notes
      t.integer :project_id
      t.integer :client_id
      t.index :client_id
      t.index :project_id

      t.timestamps
    end
  end
end
