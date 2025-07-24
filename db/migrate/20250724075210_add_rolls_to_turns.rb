class AddRollsToTurns < ActiveRecord::Migration[8.0]
  def change
    add_column :turns, :damage_roll, :integer
    add_column :turns, :chaos_roll, :integer
  end
end
