class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :estimate
      t.integer :user_id
      t.integer :project_id
      t.string :notes

      t.timestamps
    end
  end
end
