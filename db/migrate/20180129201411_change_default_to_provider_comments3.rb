class ChangeDefaultToProviderComments3 < ActiveRecord::Migration
  def change
  	change_column :provider_comments, :atencion, :float, :default => 3
  end
end
