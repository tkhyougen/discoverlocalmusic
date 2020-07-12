class Droplabel < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_country_labellings
    drop_table :user_country_labels
  end
end
