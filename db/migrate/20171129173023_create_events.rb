class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nombre
      t.string :categoria
      t.string :video_url
      t.text :content
      t.string :fecha
      t.string :lugar
      t.boolean :is_brides
      t.string :brides
      t.boolean :is_tux
      t.string :tux
      t.boolean :is_pasteles
      t.string :pasteles
      t.boolean :is_latingraf
      t.string :latingraf
      t.boolean :is_detalles
      t.string :detalles
      t.boolean :is_latino
      t.string :latino
      t.boolean :is_nissi
      t.string :nissi
      t.boolean :is_gabriella
      t.string :gabriella
      t.boolean :is_pixen
      t.string :pixen
      t.boolean :is_pelo
      t.string :pelo
      t.boolean :is_joymas
      t.string :joymas

      t.timestamps null: false
    end
  end
end
