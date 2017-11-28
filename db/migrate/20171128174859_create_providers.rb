class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nombre
      t.string :foto
      t.string :productos
      t.string :anticipacion
      t.string :telefono
      t.string :correo
      t.text :info_general
      t.text :servicios
      t.text :domicilio

      t.timestamps null: false
    end
  end
end
