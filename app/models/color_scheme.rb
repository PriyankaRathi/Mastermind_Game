class ColorScheme < ActiveRecord::Base
  validates :color_id, :color_name, :presence =>true
  validates :color_id, :format => {:with => /\A[1-9]\Z/}, :uniqueness => true

  def self.color_image_name_from_color_id color
    ColorScheme.find_by(color_id: color.to_i).color_name + ".jpg"
  end

  def self.last_color_id
    ColorScheme.last.color_id
  end
end

