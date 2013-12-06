class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.boolean :received
      t.string :notes
      t.datetime :expected_date
      t.datetime :received_date
      t.integer :milestone_id

      t.timestamps
    end
  end
end