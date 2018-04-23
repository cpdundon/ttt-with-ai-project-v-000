
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = p1
    self.player_2 = p2
  end

  def current_player
    b = self.board
    t = b.turn_count

    t % 2 ? player_1 : player_2
  end

  def won?
    c = self.board.cells

    w = WIN_COMBINATIONS
    retn = false
    ret = (0..7).each do |idx|
      e = w[idx]
      rtn = true if ((c[e[0]].to_s == c[e[1]].to_s) && (c[e[1]].to_s == c[e[2]].to_s))
    end

    ret
  end
end
