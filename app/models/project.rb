class Project < ApplicationRecord
  validates_presence_of :title, :image, :description

  mount_uploader :image, PhotoUploader
end
