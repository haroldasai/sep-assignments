require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(height){Array.new(width)}  
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if validate(x,y)
      self.matrix[y-1][x-1] = pixel
    else
      puts "invalid coordinate."
    end  
  end

  def at(x, y)
    if validate(x,y)
      self.matrix[y-1][x-1]
    else
      nil
    end    
  end

  private

  def validate(x, y)
    x > 0 && x <= width && y > 0 && y <= height
  end

end