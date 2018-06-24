class AddNombreToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :nombre, :string
  end
end
