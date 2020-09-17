class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.references :localartist, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
