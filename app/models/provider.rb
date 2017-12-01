class Provider < ActiveRecord::Base
  belongs_to :user
  has_many :provider_comments

  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
