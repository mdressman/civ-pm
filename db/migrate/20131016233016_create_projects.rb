class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :estimate
      t.integer :user_id
      t.integer :client_id
      t.string :notes

      t.timestamps
    end
  end
end
