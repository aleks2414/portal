class Provider < ActiveRecord::Base
  belongs_to :user
  has_many :provider_comments

 has_many :provider_attachments
 accepts_nested_attributes_for :provider_attachments

  extend FriendlyId
  friendly_id :nombre, use: :slugged


  def average_servicio
    provider_comments.count == 0 ? 0 : provider_comments.average(:servicio).round(2)
  end


  def average_atencion
    provider_comments.count == 0 ? 0 : provider_comments.average(:atencion).round(2)
  end


  def average_calidad
    provider_comments.count == 0 ? 0 : provider_comments.average(:calidad).round(2)
  end

end
