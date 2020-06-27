class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :comment, optional: true
  has_many :comments
end
