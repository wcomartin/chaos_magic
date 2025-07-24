class AddGlobalEffectsToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :global_effects, :jsonb, default: []
  end
end