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
require 'pry'

DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
        12, 13, 1, 2, 3, 4, 5, 6, 7, 8, 9,
        10, 11, 12, 13, 1, 2, 3, 4, 5, 6, 7,
        8, 9, 10, 11, 12, 13, 1, 2, 3, 4, 5,
        6, 7, 8, 9, 10, 11, 12, 13]

CURRENT_DECK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
                12, 13, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                10, 11, 12, 13, 1, 2, 3, 4, 5, 6, 7,
                8, 9, 10, 11, 12, 13, 1, 2, 3, 4, 5,
                6, 7, 8, 9, 10, 11, 12, 13]

PLAYER_HAND = []
DEALER_HAND = []

def prompt(txt)
  puts txt
end

def draw_a_card
  drawn_card = CURRENT_DECK.sample
  puts "THIS IS THE DRAWN CARD #{drawn_card}"
  CURRENT_DECK.delete_at(CURRENT_DECK.index(drawn_card))
  drawn_card
end

def initialize_game
  system 'clear'
  2.times { PLAYER_HAND << draw_a_card }
  2.times { DEALER_HAND << draw_a_card }
end

def player_turn
  puts "Your hand is: #{PLAYER_HAND}"
  puts "Your total is: #{PLAYER_HAND.sum}"
  answer = ''

  loop do
    if PLAYER_HAND.sum >= 21 || answer == 's'
      break
    end

    prompt "Would you like to (s)tay or (h)it?"
    answer = gets.chomp

    if answer == 'h'
      PLAYER_HAND << draw_a_card
    end

    puts "Your hand is: #{PLAYER_HAND}"
    puts "Your total is: #{PLAYER_HAND.sum}"
  end
end

def dealer_turn
  if !(DEALER_HAND.sum >= 17)
    DEALER_HAND << draw_a_card
  end
end

def check_winner
  PLAYER_HAND.sum > DEALER_HAND.sum && PLAYER_HAND.sum <= 21 ? 'Player' : 'Dealer'
end

initialize_game
player_turn
if PLAYER_HAND.sum <= 21
  dealer_turn
end
puts check_winner
puts "PLYAER: #{PLAYER_HAND.sum} and DEALER: #{DEALER_HAND.sum}"
