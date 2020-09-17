# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0

  if hand.length < 2 || hand.length > 5
    raise ArgumentError.new ("This hand has the wrong number of cards")
  end

  hand.each do |card|
    case card
    when 'Jack', 'Queen', 'King'
      score += 10
    when 'Ace'
      score += 1
    when 2..10
      score += card
    else
      raise ArgumentError.new("#{card} is not a valid card")
    end
  end

  if score <= 11 && hand.include?('Ace')
    score +=10
  end

  if score > 21
    raise ArgumentError.new ("Bust! You are over 21. Score is #{score}")
  end

  return score

end