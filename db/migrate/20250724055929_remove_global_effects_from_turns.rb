class RemoveGlobalEffectsFromTurns < ActiveRecord::Migration[7.1]
  def change
    remove_column :turns, :global_effects, :text
  end
end
