=begin 
  Problem:
    Inputs:
    Outputs:
  Examples:
  Datastructures:
    Deck: hearts, spades, diamonds, clubs, all from 1 to 13
    Value in the game for each card/group of cards
    Player and dealer hands: Arrays possibly?
    Rules possibly in a hash...
  Algorithm:
    - Initialize the deck of cards
    - Deal both dealer and player 2 cards.
      - If 1 (ace) make it 11 if total is under 11, 1 if over.
    - Show both of players cards, and one of dealers.
    - Ask player if they want to 'hit' or 'stay'
    - If stay, reveal dealers cards and hit until dealer hits over 17
    - Determine who wins the round
    - If the player 'hits', the player will add until they decide to either 'stay',
      or go over 21.
    - The player with the highest value that's not over 21 wins.
=end
DECK = [['H', 'A'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'],
        ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'],
        ['H', 'K'], ['S', 'A'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'],
        ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'],
        ['S', 'Q'], ['S', 'K'], ['C', 'A'], ['C', '2'], ['C', '3'], ['C', '4'],
        ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'],
        ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['D', 'A'], ['D', '2'], ['D', '3'],
        ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'],
        ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K']]
def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def winner(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)
  if (player_total > dealer_total && player_total < 22) || (player_total < 22 && dealer_total > 21)
    "Player"
  elsif (dealer_total > player_total && dealer_total < 22) || (dealer_total < 22 && player_total > 21)
    "Dealer"
  else
    "Tie"
  end
end

loop do
  system 'clear'
  deck = DECK

  player_cards = []
  dealer_cards = []

  2.times do
    card = deck.sample
    player_cards.push(deck.delete(card))
    card = deck.sample
    dealer_cards.push(deck.delete(card))
  end

  puts "Dealer's first card is #{dealer_cards.first}"

  loop do
    player_total = total(player_cards)
    break if busted?(player_cards)
    puts "Your cards are #{player_cards}"
    puts "Your total is #{player_total}"
    puts "(H)it or (s)tay?"

    answer = gets.chomp
    if answer == 's'
      break
    else
      card = deck.sample
      player_cards.push(deck.delete(card))
    end
  end

  loop do
    dealer_total = total(dealer_cards)
    break if dealer_total > 17
    card = deck.sample
    dealer_cards.push(deck.delete(card))
  end

  if busted?(player_cards)
    puts "You're busted with #{total(player_cards)}!"
  else
    puts "You chose to stay!"
  end

  winner = winner(dealer_cards, player_cards)
  puts "#{winner} wins this round!"

  puts "Do you want to play again?"
  reply = gets.chomp
  break if reply.downcase != 'yes'
end
