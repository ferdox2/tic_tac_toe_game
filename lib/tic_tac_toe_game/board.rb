#comment
class Board
  attr_accessor :size, :board_size

  def initialize (default_size = 3)
    @size = default_size
    @board_size = Array.new(@size, Array.new(@size))
  end

  def set_custom_size(custom_size)
    @size = custom_size

  end
end
