class AddFeaturesToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :color, :string, default: "#8abec7"
    add_column :providers, :servicio_list, :string
    add_column :providers, :domicilio_list, :string
  end
end
