class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
  has_many :comments, dependent: :destroy
  belongs_to :category
end
