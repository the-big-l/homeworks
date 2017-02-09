class Simon
  COLORS = %w(red blue green yellow)
  @@Prev_scores = []

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over?
      take_turn
      system("clear")
    end

    @@Prev_scores << @sequence_length
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless game_over?
      round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    puts 'get ready...'
    sleep 3
    system('clear')
    @seq.each do |color|
      puts "displaying sequence..."
      puts color
      sleep 0.75
      system('clear')
      puts "displaying sequence..."
      sleep 0.25
      system('clear')
    end
  end

  def require_sequence
    user_input = []
    seq.size.times do
      puts 'please repeat the sequence...'
      color = gets.chomp
      user_input << color
      system('clear')
    end

    @game_over = !(user_input == @seq)
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts 'nice round!'
  end

  def game_over_message
    puts 'you lose!'
    puts 'Previous Scores:'
    @@Prev_scores.each { |score| puts score }
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def game_over?
    game_over
  end
end
