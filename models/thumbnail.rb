class Thumbnail < ActiveRecord::Base

  has_attachment :content_type => :image,
  :storage => :file_system,
  :processor => :MiniMagick

  validates_as_attachment

end
