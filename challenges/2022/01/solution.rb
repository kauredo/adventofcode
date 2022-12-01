# frozen_string_literal: true
module Year2022
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      total_per_person.last
    end

    def part_2
      total_per_person.last(3).sum
    end

    private

    def total_per_person
      split_data.map do |person|
        person.sum
      end.sort
    end

  end
end
