class CreateEventAttachments < ActiveRecord::Migration
  def change
    create_table :event_attachments do |t|
      t.references :event, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
