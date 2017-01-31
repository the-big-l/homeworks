require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { [] }
    @stores = {}
    stores
    place_stones
  end

  def stores
    @stores[@name1] = 6
    @stores[@name2] = 13
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      cups[i] += Array.new(4) { :stone }
    end
  end

  def valid_move?(start_pos)
    unless ((0..5).to_a + (7..12).to_a).include?(start_pos)
      raise 'Invalid starting cup'
    end
    true
  end

  def make_move(start_pos, current_player_name)
    stones = empty_cup(start_pos)
    cup = start_pos
    until stones.empty?
      cup += 1
      next if (cup + 7) % 14 == @stores[current_player_name]
      cups[cup % 14] << stones.pop
    end
    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end

  def empty_cup(index)
    stones = []
    until cups[index].empty?
      stones << cups[index].pop
    end

    stones
  end

  def distribute_stones(start_pos, stones, current_player_name)

  end
end
