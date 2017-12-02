class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
