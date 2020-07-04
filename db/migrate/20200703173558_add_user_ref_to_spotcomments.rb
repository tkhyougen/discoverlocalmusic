class AddUserRefToSpotcomments < ActiveRecord::Migration[5.2]
  def change
    add_reference :spotcomments, :user, foreign_key: true
  end
end
