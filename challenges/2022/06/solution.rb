# frozen_string_literal: true

module Year2022
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      char_map = process_data
      find_uniq(char_map, 4)
    end

    def part_2
      char_map = process_data
      find_uniq(char_map, 14)
    end

    private

    def process_data
      data.chars.each_with_index.map { |char, id| [id + 1, char] }
    end

    def find_uniq(char_map, num)
      str = ''
      found = false
      id = 0

      until found
        id, char = char_map[id]
        str += char
        last_num = str.chars.last(num)
        found = true if last_num.uniq.count == num
      end

      id
    end
  end
end
