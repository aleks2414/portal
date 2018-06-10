class AddCoverToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :cover_photo, :string
  end
end
