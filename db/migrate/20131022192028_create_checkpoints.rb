class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :estimate
      t.integer :user_id
      t.integer :milestone_id
      t.string :notes

      t.timestamps
    end
  end
end
