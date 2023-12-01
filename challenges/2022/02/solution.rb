# frozen_string_literal: true

module Year2022
  class Day02 < Solution
    POINTS = {
      'X' => 1,
      'Y' => 2,
      'Z' => 3,
      'A' => 1,
      'B' => 2,
      'C' => 3
    }.freeze

    HAND = {
      'A' => 'X',
      'B' => 'Y',
      'C' => 'Z'
    }.freeze

    RESULTS = {
      'X' => 0,
      'Y' => 3,
      'Z' => 6
    }.freeze

    def part_1
      score = 0
      results = {}

      data.map(&:split).each do |opponent, you|
        temp_score = 0
        temp_score += POINTS[you]

        temp_score += calculate_result(opponent, you)
        score += temp_score
        results[opponent + you] = temp_score
      end

      score
    end

    def part_2
      score = 0
      results = {}

      data.map(&:split).each do |opponent, result|
        temp_score = 0
        temp_score += RESULTS[result]

        temp_score += calculate_hand(opponent, result)
        score += temp_score
        results[opponent + result] = temp_score
      end

      score
    end

    private

    def calculate_result(opponent, you)
      case POINTS[you] - POINTS[opponent]
      when 0
        3
      when 1, -2
        6
      when 2, -1
        0
      end
    end

    def calculate_hand(opponent, result)
      hands = %w[A B C]

      case RESULTS[result]
      when 0 # lose
        hand = hands.find_index(opponent) - 1
        POINTS[hands[hand]]
      when 3 # draw
        POINTS[opponent]
      when 6 # win
        hand = hands.find_index(opponent) + 1
        hand -= 3 if hand == 3
        POINTS[hands[hand]]
      end
    end
  end
end
