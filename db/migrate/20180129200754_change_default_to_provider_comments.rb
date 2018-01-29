class ChangeDefaultToProviderComments < ActiveRecord::Migration


  def change
  	change_column :provider_comments, :calidad, :float, :default => 3
  end
end
