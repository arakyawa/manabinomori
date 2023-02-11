class AddYoutubeUrlToCalculations < ActiveRecord::Migration[6.1]
  def change
    add_column :calculations, :youtube_url, :string
  end
end
