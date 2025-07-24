class AddStatusAndArchivedAtToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :status, :string
    add_column :games, :archived_at, :datetime
  end
end
