class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.datetime :deadline
      t.datetime :start_date
      t.integer :estimate
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
