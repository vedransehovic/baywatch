class CreateBays < ActiveRecord::Migration[6.0]
  def change
    create_table :bays do |t|
      t.integer :bay_number
      t.date :date
      t.integer :production_id
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
