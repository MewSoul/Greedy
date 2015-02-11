class AddStreamurlToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :url_stream, :text
  end
end
