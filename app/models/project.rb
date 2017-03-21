class Project < ApplicationRecord
  validates_presence_of :title, :image, :description, :summary

  mount_uploader :image, PhotoUploader
end
