class EventAttachment < ActiveRecord::Base
  belongs_to :event
  mount_uploader :image, ImageUploader
end
