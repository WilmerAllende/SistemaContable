class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.date :fecha
      t.text :comentario

      t.timestamps
    end
  end
end
