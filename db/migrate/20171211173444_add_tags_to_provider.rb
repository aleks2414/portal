class AddTagsToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :tags, :string
  end
end
