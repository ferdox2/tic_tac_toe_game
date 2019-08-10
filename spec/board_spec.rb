require 'spec_helper'

module TicTacToeGame
  class Board
    RSpec.describe Board do
      context '.initialize' do
        it 'Raises an exception when initialized with {}' do
          expect { Board.new({}) }.to raise_error
        end
      end
    end
  end
end
