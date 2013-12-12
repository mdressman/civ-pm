class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.boolean :received, :default => false
      t.string :notes
      t.datetime :expected_date
      t.datetime :received_date
      t.integer :project_id
      t.string :link

      t.timestamps
    end
  end
end
