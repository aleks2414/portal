class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments

 has_many :event_attachments
 accepts_nested_attributes_for :event_attachments

  extend FriendlyId
  friendly_id :nombre, use: :slugged

  def average_rating
    comments.count == 0 ? 0 : comments.average(:rating).round(2)
  end

end
