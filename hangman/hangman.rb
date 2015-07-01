require 'yaml'

class Hangman
  def initialize
    puts "\n**Welcome to Hangman!**\n\n"
    intro
  end

  def dictionary
    File.open("5desk.txt", "r").readlines.select do |word|
      word.length > 4 && word.length < 13 && word[0].match(/\p{lower}/)
	end
  end
  
  def quiz_word
    dictionary.sample.chomp
  end
  
  def hide_word
    @word.split("").map { |letter| letter = "-"}
  end
    
  def intro
    puts "(N)ew"
	puts "(L)oad saved game"
	puts "(Q)uit"
	intro_input
  end
 
  def intro_input
    user = gets.chomp.downcase
	if user == "n"
	  new_game
	elsif
	  user == "l"
        load
    elsif
	  user == "q"
	    quit
	else
	  intro
	end
  end  
  
  def quit
    puts "Thanks for playing!"
    exit
  end
  
  def game_over
    puts ""
	puts "Game Over! The word was: '#{@word}'!"
	intro
  end
  
  def new_game
    @word = quiz_word
	@guessed = []
	@dashes = hide_word
	@chances = 11
    play
  end
  
  def play
    puts "Type: 'save', 'menu' or 'quit' at any time."  
    while @chances > 0
	  puts ""
	  puts @dashes.join(" ")
	  puts ""
	  print @guessed.join(',')
	  puts ""
	  puts "Chances remaining: #{@chances}"
	  puts ""
	  puts "\nEnter a letter"
	  puts ""
	  check_input	  
    end
	game_over
  end
    
  def check_input
    guess = gets.chomp.downcase
	if guess == "save"
	  save
	elsif
	  guess == "quit"
	  quit
	elsif
	  guess == "menu"
	  intro
	else
	  puts "> > > > > > > > > > > >\n"
	  check_guesses(guess)
	end
  end
  
  def check_guesses(letter)
    if @guessed.include?(letter)
	  puts ""
	  puts "Already tried '#{letter}'. Try again"
	play  
	elsif
	  @dashes.include?(letter)
	  puts ""
	  puts "Already tried '#{letter}'. Try again"
	else
	  check_word(letter)
	end  
  end

  def check_word(letter)
    @word.split("").each_with_index do |char, i|
	  if char == letter
	    @dashes[i] = char
	  end
	end
    response(letter)	
  end
	
  def response(letter)	
	if @word.include?(letter)
	  puts ""
	  puts "Good guess! '#{letter}' is in the word!"
	  check_victory
	else 
	  puts ""
	  puts "Nope, '#{letter}' is not in the word."
	  @guessed << letter
	  @chances -= 1
	end
  end
  
  def check_victory
    if @dashes.join("") == @word
	  puts ""
	  puts "You win! The word was: '#{@word}'"
	  puts ""
	  intro
	end	
  end
  
  def load
    if File.exists?("saves/saved.yaml")
      saved_game = YAML::load(File.read("saves/saved.yaml"))
      saved_game.play
	else
      puts "No saved games yet"
      intro
    end	  
  end

  def save
    Dir.mkdir("saves") unless Dir.exists? ("saves")
	File.open("saves/saved.yaml", "w") do |file|
	  file.write(YAML::dump(self))
    end
	puts "Game saved!"
	intro
  end
    	  
end

game = Hangman.new
