# frozen_string_literal: true

module Year2023
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file
    DIGITS = %w[zero one two three four five six seven eight nine].freeze

    def part_1
      data.map do |line|
        new_line = line.chars.map do |char|
          char if char.match?(/[0-9]/)
        end
        [new_line.compact.first, new_line.compact.last].join('').to_i
      end.sum
    end

    def part_2
      new_data = data.map do |line|
        # get all numbers 0-9, or words that match DIGITS
        first_digit = line.scan(/[0-9]|#{DIGITS.join('|')}/).first
        last_digit = line.reverse.scan(/[0-9]|#{DIGITS.map(&:reverse).join('|')}/).first.reverse

        [simplify_num(first_digit), simplify_num(last_digit)].join('').to_i
      end
      new_data.sum
    end

    private

    def simplify_num(num)
      if num.match?(/[0-9]/)
        num
      else
        DIGITS.index(num)
      end
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
