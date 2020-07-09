class CreateSpotfavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :spotfavorites do |t|
      t.integer :user_id
      t.integer :spot_id

      t.timestamps
    end
  end
end
