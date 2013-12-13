class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.string :name
      t.boolean :complete, :default => false
      t.datetime :completed_date
      t.integer :user_id
      t.string :notes
      t.integer :project_id
      t.string :link
      t.integer :position

      t.timestamps
    end
  end
end
