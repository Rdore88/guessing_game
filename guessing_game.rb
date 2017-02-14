def higher(number, guessed)
  puts "You guessed #{number} which is too high"
  if guessed == 5
    puts "Too many guesses you lose, better luck next time"
    return false
  elsif guessed < 5
    puts "Please guess again."
  end
end

def lower(number, guessed)
  puts "You guessed #{number} which is too low"
  if guessed == 5
    puts "Sorry you lose, better luck next time"
    return false
  elsif guessed < 5
    puts "Please guess again."
  end
end

puts "This is a number guessing game. Please guess a number between 1 and 100"
questions_asked = 0
answer = rand(1..100)
while questions_asked < 5
user_guess = gets.chomp.to_i
  if user_guess < answer
      questions_asked += 1
      lower(user_guess, questions_asked)
  elsif user_guess > answer
    questions_asked += 1
    higher(user_guess, questions_asked)
  else
    puts "Congrats you guessed the right number!"
    break
  end
end
