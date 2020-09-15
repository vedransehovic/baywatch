class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :bay_id
      t.integer :production_id
      t.integer :user_id

      t.timestamps
    end
  end
end
