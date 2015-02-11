class AddChatToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :url_chat, :text
  end
end
