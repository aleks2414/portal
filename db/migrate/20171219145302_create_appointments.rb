class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start
      t.datetime :end
      t.references :provider, index: true, foreign_key: true
      t.string :servicio_tienda
      t.string :servicio_domicilio
      t.string :title
      t.string :evento
      t.string :correo
      t.string :telefono
      t.string :direccion
      t.string :status_one, default: "Por confirmar"
      t.string :status_two

      t.timestamps null: false
    end
  end
end
