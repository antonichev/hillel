###########################################################
#                   Updates & fixes
# 1.Add array with used chars to show it to user
# 2.Make checks if user entered used char
###########################################################

require_relative 'life_counter'
require_relative 'word'

class Game
  def initialize
    @life_counter = LifeCounter.new
    @word = Word.new
    @user_chars = []
  end

  def run
    game_loop
    check_result
  end

  private

  def game_loop
    loop do
      2.times { puts '' }

      announce_game_state
      user_char = read_input
      guessed = @word.char_exists?(user_char)

      if guessed
        break if @word.finished?
      else
        @life_counter.decrement
        break if @life_counter.dead?
      end
    end
  end

  def check_user_input?(input)
    if input.length > 1
      puts 'You need to enter only one char'
      false
    else
      true
    end
  end

  def announce_game_state
    puts "Your life total is #{@life_counter.life_count}"
    puts "Used chars: #{@user_chars}"
    puts "Your word is #{@word.visible_word}"
  end

  def read_input
    puts 'Enter your char:'
    char = gets.chomp!.to_s

    if check_user_input?(char)
      add_char_to_array(char)
    end

    char
  end

  def add_char_to_array(new_char)
    if !@user_chars.include?(new_char)
      @user_chars.push(new_char)
    else
      puts "Char #{new_char} is already used"
    end
  end

  def check_result
    if @word.finished?
      puts 'You are victorious!'
    else
      puts 'You are dead... Sorry.'
    end

    puts "Your word is #{@word.secret_word}"
  end
end
