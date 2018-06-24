class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :imagen_promo
      t.boolean :disponible

      t.timestamps null: false
    end
  end
end
