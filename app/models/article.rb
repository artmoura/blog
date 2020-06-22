class Article < ApplicationRecord
  belongs_to :admin
  has_many :comments
  mount_uploader :highlight_image, ImageUploader
  before_validation :generate_metadata

  def generate_metadata(c = 1)
    if self.title_changed? || self.new_record?
      metadata = self.title.gsub(" ", "_").downcase
      metadata = c === 1 ? metadata : "#{metadata}#{c}"
      return generate_metadata(c + 1) if Article.find_by(metadata: metadata)
      self.metadata = metadata
    end
  end
end
