class ColorScheme < ActiveRecord::Base
  validates  :color_id, :color_name, :presence =>true
  validates :color_id , :format =>{:with => /\A[1-9]\Z/} , :uniqueness => true

  def self.find_color color
    ColorScheme.find_by(color_id: color.to_i).color_name + ".jpg"
  end
end

