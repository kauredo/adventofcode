# frozen_string_literal: true

module Year2022
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file
    ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a
    def part_1
      total = 0
      numbers = {}
      data.each do |line|
        first = line.split('').first(line.length / 2)
        last = line.split('').last(line.length / 2)
        common = (first & last).first

        number = ALPHABET.index(common) + 1

        numbers[common] = number
        total += number
      end
      total
    end

    def part_2
      total = 0
      numbers = {}
      data.each_slice(3) do |lines|
        lines.map! { |line| line.split('') }
        common = lines.reduce(:&).first
        number = ALPHABET.index(common) + 1

        numbers[common] = number
        total += number
      end
      total
    end

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
