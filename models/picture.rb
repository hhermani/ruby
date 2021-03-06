class Picture < ActiveRecord::Base

  has_attachment :content_type => :image,
  :storage => :file_system,
  :max_size =>3.megabytes,
  :resize_to => '640x480',
  :thumbnails => { :thumb => '100x200'}, 
  :processor => :MiniMagick,
  :thumbnail_class => Thumbnail

  validates_as_attachment


  #  validates_format_of :content_type,
  #  :with => /^image/,
  #  :message => "-- you can only upload pictures"

#  validates_presence_of :comment, :url
#  validates_uniqueness_of :url

  #  def uploaded_picture=(picture_field)
  #    self.name = base_part_of(picture_field.original_filename)
  #    self.content_type = picture_field.content_type.chomp
  #    self.data = picture_field.read
  #  end

  #  def base_part_of(filename)
  #    File.basename(filename).gsub(/[^\w._-]/, '')
  #  end

  # preferred_url is a virtual attribute and will be mapped on url
  def preferred_url
    @preferred_url
  end

  def preferred_url=(p_url)
    self.url = p_url.gsub(/ /,'_')
  end
end
