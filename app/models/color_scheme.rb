class ColorScheme < ActiveRecord::Base
  validates  :color_id, :color_name, :presence =>true
  validates :color_id , :format =>{:with => /\A\d+\Z/} , :uniqueness => true

  def self.find_color color
    ColorScheme.find(color.to_i).color_name + ".jpg"
  end
end

