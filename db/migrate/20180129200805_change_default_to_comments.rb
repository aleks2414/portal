class ChangeDefaultToComments < ActiveRecord::Migration
  def change
  	change_column :comments, :rating, :float, :default => 3
  end
end
