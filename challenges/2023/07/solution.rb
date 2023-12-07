# frozen_string_literal: true

module Year2023
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file
    CARD_STRENGTH = %w[2 3 4 5 6 7 8 9 T J Q K A].map.with_index.to_h.freeze
    CARD_STRENGTH_JOKER_LOW = %w[J 2 3 4 5 6 7 8 9 T Q K A].map.with_index.to_h.freeze
    REGEXES = {
      five_of_a_kind: /(\w)\1{4}/,
      four_of_a_kind: /(\w)\1{3}/,
      full_house: /(\w)\1{2}(\w)\2|\w(\w)\3\w(\w)\4/,
      three_of_a_kind: /(\w)\1{2}/,
      two_pairs: /(\w)\1(\w)\2|\w(\w)\3\w(\w)\4/,
      one_pair: /(\w)\1/,
      high_card: /(\w)/
    }.freeze
    HAND_STRENGTH = REGEXES.keys.reverse.map.with_index.to_h.freeze

    def part_1
      hands = data.map { |line| line.split(' ') }
      hands_with_strength = create_hands_with_strength(hands)
      sort_and_calculate_scores(hands_with_strength, CARD_STRENGTH)
    end

    def part_2
      hands = data.map { |line| line.split(' ') }
      hands_with_strength = create_hands_with_strength(hands, joker_is_high: false)
      sort_and_calculate_scores(hands_with_strength, CARD_STRENGTH_JOKER_LOW)
    end

    private

    def create_hands_with_strength(hands, joker_is_high: true)
      card_strength = joker_is_high ? CARD_STRENGTH : CARD_STRENGTH_JOKER_LOW
      hands.map do |hand, bid|
        sorted_hand = sort_hand(hand, card_strength)

        sorted_hand = remove_jokers(hand, sorted_hand) unless joker_is_high

        bid = bid.to_i
        hand_strength = REGEXES.find { |_, regex| regex.match(sorted_hand) }[0]
        [hand, sorted_hand, hand_strength, bid]
      end
    end

    def sort_and_calculate_scores(hands_with_strength, card_strength)
      hands_with_strength.sort_by! do |hand, _, hand_strength, _bid|
        [HAND_STRENGTH[hand_strength], hand.chars.map { |card| card_strength[card] }].flatten
      end

      scores = hands_with_strength.map.with_index do |(_hand, _, _hand_strength, bid), index|
        bid * (index + 1)
      end

      scores.sum
    end

    def remove_jokers(hand, sorted_hand, card_strength = CARD_STRENGTH_JOKER_LOW)
      sorted_hand_without_jokers = sorted_hand.gsub(/J/, '')
      sorted_hand = card_strength.keys.last * 5 if sorted_hand_without_jokers == ''
      sorted_hand.gsub!(/J/, sorted_hand.gsub(/J/, '').chars.first) if hand.include?('J')
      sort_hand(sorted_hand, card_strength)
    end

    def sort_hand(hand, sort_algorithm = CARD_STRENGTH)
      sorted_hand = hand.chars.sort_by { |card| sort_algorithm[card] }.join
      sorted_hand.chars.group_by { |card| card }.sort_by do |char, cards|
        char_position = sorted_hand.chars.reverse.index(char)
        [cards.length, char_position]
      end.reverse.map(&:last).flatten.join
    end

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line
    end

    # Processes the dataset as a whole
    def process_dataset(set)
      set
    end
  end
end
