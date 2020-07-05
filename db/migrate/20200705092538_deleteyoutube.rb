class Deleteyoutube < ActiveRecord::Migration[5.2]
  def change
    drop_table :youtubes
  end
end
