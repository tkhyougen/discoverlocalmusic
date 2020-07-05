class AddYoutubeUrlToLocalartists < ActiveRecord::Migration[5.2]
  def change
    add_column :localartists, :youtube_url, :string
  end
end
