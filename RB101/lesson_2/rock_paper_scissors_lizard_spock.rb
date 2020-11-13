VALID_CHOICES = %w(rock paper scissors spock lizard)

VALID_INPUT_CHOICES = ['(r)ock', '(p)aper', '(sc)issors', '(sp)ock', '(l)izard']

RULES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['scissors', 'rock']
}

VALID_SHORTHAND_INPUTS = {
  sp: 'spock',
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  l: 'lizard'
}

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  RULES[first.to_sym].include?(second)
end

def display_results(winner, computer_score, user_score)
  case winner
  when 'computer'
    prompt("The computer won!")
  when 'user'
    prompt("You won!")
  else
    prompt("It's a tie!")
  end

  prompt("The score is: User: #{user_score}, Computer: #{computer_score}")

  if user_score == 5
    prompt("User is the grandmaster and wins the match!")
  elsif computer_score == 5
    prompt("Computer is the grandmaster and wins the match!")
  end
end

def user_choice(input)
  if VALID_CHOICES.include?(input)
    input
  elsif VALID_SHORTHAND_INPUTS.include?(input.to_sym)
    VALID_SHORTHAND_INPUTS[input.to_sym]
  end
end

computer_score = 0
user_score = 0

loop do
  system('clear')
  choice = ''
  loop do
    prompt("Choose one: #{VALID_INPUT_CHOICES.join(', ')}")
    choice = gets.chomp

    if user_choice(choice)
      choice = user_choice(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  if win?(computer_choice, choice)
    computer_score += 1
    round_winner = 'computer'
  elsif win?(choice, computer_choice)
    user_score += 1
    round_winner = 'user'
  end

  prompt("You chose: #{choice}, the Computer chose: #{computer_choice}")

  display_results(round_winner, computer_score, user_score)

  prompt("Do you want to play again? (y)es to continue, any other key to quit")
  answer = gets.chomp.downcase

  if answer == 'y' || answer == 'yes'
    if computer_score == 5 || user_score == 5
      computer_score = 0
      user_score = 0
    end
  else
    break
  end
end
