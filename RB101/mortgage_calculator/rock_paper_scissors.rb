VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  rock_win?(first, second) ||
    paper_win?(first, second) ||
    scissors_win?(first, second) ||
    lizard_win?(first, second) ||
    spock_win?(first, second)
end

def rock_win?(first, second)
  first == 'rock' && (second == 'scissors' || second == 'lizard')
end

def paper_win?(first, second)
  first == 'paper' && (second == 'rock' || second == 'spock')
end

def scissors_win?(first, second)
  first == 'scissors' && (second == 'paper' || second == 'lizard')
end

def lizard_win?(first, second)
  first == 'lizard' && (second == 'spock' || second == 'paper')
end

def spock_win?(first, second)
  first == 'spock' && (second == 'scissors' || second == 'rock')
end

def display_results(user, computer)
  if user == computer
    prompt("It's a tie!")
  elsif win?(user, computer)
    prompt("You won!")
  else
    prompt("The computer won!")
  end
end

loop do
  system('clear')
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts("You chose: #{choice}, the Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end
