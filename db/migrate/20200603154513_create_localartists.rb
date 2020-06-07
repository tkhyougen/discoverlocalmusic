class CreateLocalartists < ActiveRecord::Migration[5.2]
  def change
    create_table :localartists do |t|
      t.string :name
      t.string :country
      t.string :image
      t.text :post_comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
