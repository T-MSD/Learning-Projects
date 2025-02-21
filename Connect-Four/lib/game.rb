# frozen_string_literal: true

# Class Game
class Game
  attr_reader :colors

  def initialize
    @colors = {
      red: '🔴',
      blue: '🔵'
    }
  end
end
