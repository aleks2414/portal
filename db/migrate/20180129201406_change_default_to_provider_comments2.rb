class ChangeDefaultToProviderComments2 < ActiveRecord::Migration
  def change
  	change_column :provider_comments, :servicio, :float, :default => 3
  end
end
