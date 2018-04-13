class CreateJoinTableEventProvider < ActiveRecord::Migration
  def change
    create_join_table :events, :providers do |t|
      # t.index [:event_id, :provider_id]
      # t.index [:provider_id, :event_id]
    end
  end
end
