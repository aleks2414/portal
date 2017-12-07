class CreateProviderAttachments < ActiveRecord::Migration
  def change
    create_table :provider_attachments do |t|
      t.references :provider, index: true, foreign_key: true
      t.string :image2

      t.timestamps null: false
    end
  end
end
