class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.references :account, foreign_key: true
      t.string :referencia_m
      t.integer :tipo
      t.decimal :monto
      t.belongs_to :movement, foreign_key: true

      t.timestamps
    end
  end
end
