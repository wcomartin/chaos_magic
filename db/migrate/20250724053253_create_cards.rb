class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :card_type
      t.text :oracle_text
      t.text :flavor_text

      t.timestamps
    end
  end
end
