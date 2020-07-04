class CreateSpotcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :spotcomments do |t|
      t.references :spot, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
