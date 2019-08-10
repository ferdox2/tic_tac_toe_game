require 'spec_helper'

module TicTacToeGame
  class Player
    RSpec.describe Player do
      context '.initialize' do
        it 'Raises an exception when initialized with {}' do
          expect { Player.new({}) }.to raise_error
        end
      end
    end
  end
end
