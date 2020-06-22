class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :highlight_image, ImageUploader
end
