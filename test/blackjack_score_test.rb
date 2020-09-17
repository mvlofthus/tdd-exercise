require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal(7)
  end

  it 'facecards have values calculated correctly' do

    # Arrange
    hand = ['Queen', 4]

    #Act
    score = blackjack_score(hand)

    #Assert
    expect(score).must_equal(14)

  end

  it 'calculates aces as 11 where it does not go over 21' do
    # Arrange
    hand = [3, 'Ace', 2]

    #Act
    score = blackjack_score(hand)

    #Assert
    expect(score).must_equal(16)

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    # Arrange
    hand = [6, 'Ace', 'King']

    #Act
    score = blackjack_score(hand)

    #Assert
    expect(score).must_equal(17)

  end


  it 'raises an ArgumentError for invalid cards' do
    expect{
      blackjack_score(['banana', 2])
    }.must_raise ArgumentError

    expect{
      blackjack_score(['King', 'Ace', 12])
    }.must_raise ArgumentError

    expect{
      blackjack_score([23, 'sandwich'])
    }

  end

  it 'raises an ArgumentError for scores over 21' do
    expect{
      blackjack_score([8, 9, 5])
    }.must_raise ArgumentError

    expect{
      blackjack_score(['Queen','King', 4])
    }.must_raise ArgumentError

    expect{
      blackjack_score([4, 10, 'Ace', 7])
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for hands of <2 cards or >5 cards' do
    expect{
      blackjack_score([8])
    }.must_raise ArgumentError

    expect{
      blackjack_score(['Ace', 2, 2, 2, 2, 3])
    }.must_raise ArgumentError

  end

end
