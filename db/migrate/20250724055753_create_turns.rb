class CreateTurns < ActiveRecord::Migration[8.0]
  def change
    create_table :turns do |t|
      t.references :game, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.text :global_effects

      t.timestamps
    end
  end
end
