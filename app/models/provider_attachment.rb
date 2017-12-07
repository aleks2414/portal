class ProviderAttachment < ActiveRecord::Base
  belongs_to :provider
  mount_uploader :image2, Image2Uploader
end
