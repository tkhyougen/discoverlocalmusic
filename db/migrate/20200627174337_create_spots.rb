class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :country
      t.string :image
      t.text :post_comment
      t.string :genre

      t.timestamps
    end
  end
end
