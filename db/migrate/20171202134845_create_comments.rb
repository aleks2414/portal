class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nombre
      t.text :mensaje
      t.integer :rating
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
