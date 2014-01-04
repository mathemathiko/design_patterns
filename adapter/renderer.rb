class Renderer
  def render(text_object)
    text  = text_object.text
    size  = text_object.size_inches
    color = text_object.color
  end
end

class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size_inches, color)
    @text        = text
    @size_inches = size_inches
    @color       = color
  end
end

class BritishTextObject < TextObject
  def initialize(bto)
    @bto = bto
  end

  def text
    @bto.string
  end
  
  def size_inches
    @bto.size_mm / 25.4 
  end

  def color
    @bto.colour
  end
end
