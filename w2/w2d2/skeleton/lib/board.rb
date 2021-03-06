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
    stones = @cups[start_pos]
    @cups[start_pos] = []

    # distributes stones
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      # places stones in the correct current player's cups
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    # render
    next_turn(cup_idx)
  end

  def next_turn(cup)
     if cup == 6 || cup == 13
       :prompt
     elsif cups[cup].count == 1
       :switch
     else
       cup
     end
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
end
