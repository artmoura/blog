class ApplicationRecord < ActiveRecord::Base
  include ActionText::Attribute
  self.abstract_class = true
end
