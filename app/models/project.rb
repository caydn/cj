class Project < ApplicationRecord
  validates_presence_of :title, :image, :description, :summary

  extend FriendlyId
  friendly_id :title, use: :slugged
  def should_generate_new_friendly_id?
   slug.blank? || title_changed?
 end

  mount_uploader :image, PhotoUploader
end
