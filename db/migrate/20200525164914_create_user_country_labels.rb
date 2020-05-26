class CreateUserCountryLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :user_country_labels do |t|
      t.string :name

      t.timestamps
    end
  end
end
