class Article < ApplicationRecord
  belongs_to :admin, optional: true
  belongs_to :category
  has_many :comments
  mount_uploader :highlight_image, ImageUploader
  before_validation :generate_metadata
  enum status: [:escrevendo, :publicado]
  # has_rich_text :content
  # has_rich_text :highlight

  def default_values
  end

  def generate_metadata(c = 1)
    if self.title_changed? || self.new_record?
      metadata = self.title.gsub(" ", "_").downcase
      metadata = c === 1 ? metadata : "#{metadata}#{c}"
      return generate_metadata(c + 1) if Article.find_by(metadata: metadata)
      self.metadata = metadata
    end
  end
end
