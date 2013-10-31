class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.integer :estimate
      t.integer :user_id
      t.integer :milestone_id
      t.string :notes

      t.timestamps

      add_index :assets, :milestone_id
    end
  end
end
