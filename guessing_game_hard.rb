numbers_guessed = []

def higher(number, guessed, included)
    if guessed == 5
    puts "Too many guesses you lose, better luck next time"
    return false
  elsif included == true
    puts "You guessed #{number} again which is too high still, are you ok?"
    puts "Please guess again."
  else
    puts "You guessed #{number} which is too high."
  end
end

def colder(guessed)
  if guessed == 5
    puts "Too many guesses you lose, better luck next time"
    return false
  else
    puts "Your getting colder."
  end
end

def lower(number, guessed, included)
    if guessed == 5
    puts "Too many guesses you lose, better luck next time"
    return false
  elsif included == true
    puts "You guessed #{number} again which is too low still, are you ok?"
    puts "Please guess again."
  else
    puts "You guessed #{number} which is too low."
  end
end

puts "This is a number guessing game. Please guess a number between 1 and 100"
questions_asked = 0
answer = (1..100).to_a.sample
potential_answers = (1..100).to_a
while questions_asked < 5
user_guess = gets.chomp.to_i
  if user_guess < answer
    questions_asked += 1
    potential_answers.delete_if {|number| number < user_guess }
      if numbers_guessed.include?(user_guess)
        lower(user_guess, questions_asked, numbers_guessed.include?(user_guess))
      elsif potential_answers.include?(user_guess) == false
        colder(questions_asked)
        numbers_guessed.push(user_guess)
      else
        lower(user_guess, questions_asked, numbers_guessed.include?(user_guess))
        numbers_guessed.push(user_guess)
      end
  elsif user_guess > answer
  questions_asked += 1
  potential_answers.delete_if {|number| number > user_guess }
      if numbers_guessed.include?(user_guess)
        higher(user_guess, questions_asked, numbers_guessed.include?(user_guess))
      elsif potential_answers.include?(user_guess) == false
        colder(questions_asked)
        numbers_guessed.push(user_guess)
      else
        higher(user_guess, questions_asked, numbers_guessed.include?(user_guess))
        numbers_guessed.push(user_guess)
      end
  else
    puts "Congrats you guessed the right number!"
    break
  end
end
