class CreateUserCountryLabellings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_country_labellings do |t|
      t.integer :user_id
      t.integer :user_country_label_id

      t.timestamps
    end
  end
end
