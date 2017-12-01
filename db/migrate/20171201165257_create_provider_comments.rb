class CreateProviderComments < ActiveRecord::Migration
  def change
    create_table :provider_comments do |t|
      t.string :nombre
      t.text :mensaje
      t.integer :servicio
      t.integer :atencion
      t.integer :calidad
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
