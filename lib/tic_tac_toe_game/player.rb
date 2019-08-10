#comment

module TicTacToeGame

  class Player
    attr_reader :name, :side

    def initialize(name, side)
      @name = name
      @side = side
    end

    def show_info
      "#{@name} with #{@side} side"
    end
  end
end
