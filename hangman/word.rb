###########################################################
#                   Updates & fixes
# 1. Replace "_" with "*"
# 2. Show spaces at start
# 3. Add topics
#
#
#
###########################################################

class Word
  attr_reader :visible_word, :secret_word

  def initialize
    topic = theme_of_game

    if topic == 'harry_potter'
      @secret_word = Faker::HarryPotter.character.downcase
    elsif topic == 'lotr'
      @secret_word = Faker::LordOfTheRings.character.downcase
    else
      @secret_word = Faker::StarWars.character.downcase
    end

    @visible_word = '*' * @secret_word.length

    char_exists?(' ')
  end

  def theme_of_game
    puts "Choose your topic:\n1. Star Wars (default)\n2. Harry Potter \n" \
     '3. Lord Of The Rings'

    choise = gets.chomp!.to_i

    case choise
    when 1
      puts 'Star wars is selected'
      'star_wars'
    when 2
      puts 'Harry potter is selected'
      'harry_potter'
    when 3
      puts 'Lord Of The Ring is selected'
      'lotr'
    else
      puts 'Incorrect choise. Star wars is selected'
      'star_wars'
    end
  end

  def char_exists?(char)
    indexes = find_indexes(char)

    update_visible_word(indexes, char)

    !indexes.empty?
  end

  def finished?
    !@visible_word.include?('*')
  end

  def update_visible_word(indexes, char)
    indexes.each do |index|
      @visible_word[index] = char
    end
  end

  def find_indexes(char)
    indexes = []

    @secret_word.split('').each_with_index do |symbol, index|
      indexes << index if symbol == char
    end

    indexes
  end
end
