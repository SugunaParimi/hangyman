class Hangman

def initialize
   @word =words.sample
   @lives = 7
   @word_teaser =""
   @word.first.size.times do
   @word_teaser += "_ " 
    end
end

def words
    [
     ["company", " A place where talent was enhanced"],
     ["interns", "its a kind of being in job"],
     ["testers", "analyse the output efficiency"],
     ["devteam", "working to develop the best"],
     ["familie", "people makes the life beautiful"],
     ["balence", "person shold learn to have cool life"],
    ]
end

def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
end

def update_teaser last_guess
    new_teaser =@word_teaser.split
    new_teaser.each_with_index do |letter, index|
    if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
    end
end
 @word_teaser = new_teaser.join(" ")
end

def make_guess
  if @lives >0
    puts "Enter a letter"
    guess =gets.chomp
    good_guess = @word.first.include? guess
    if guess == "exit"
        puts "Thanks for playing!"
    elsif guess.length > 1
        puts "Only guess 1 letter at a time please"
        make_guess
    elsif good_guess
      puts "Your Guess is Correct"
      print_teaser guess
     if @word.first == @word_teaser.split.join
      puts "Congratulations.. you have won this round!"
    else
        make_guess
    end
else
        @lives -= 1
      puts "Sorry, you have #{ @lives } left, Try Again... "
      make_guess
    end
  else 
    puts "Game Over.. Better Luck next time..."
end
  
end
def begin
  puts "New game started... your word is #{ @word.first.size } characters long"
  print_teaser
  puts "your clue is #{ @word.last }"
  make_guess
end

end
game =Hangman.new
game.begin