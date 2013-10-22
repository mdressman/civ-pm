class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.string :notes
      t.integer :milestone_id

      t.timestamps
    end
  end
end
