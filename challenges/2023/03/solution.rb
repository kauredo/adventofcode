# frozen_string_literal: true

module Year2023
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file
    NUMBER = /\d+/.freeze
    NOT_SPECIAL = /[0-9a-zA-Z.]/.freeze
    SPECIAL = /[^0-9a-zA-Z.]/.freeze
    STAR = /\*/.freeze

    def part_1
      # pad the data with a border of . to avoid having to check for out of bounds
      data = padded_data
      valid_positions = []
      accepted_numbers = {}
      coordinates_around = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [-1, 1], [1, -1], [1, 0], [1, 1]]

      data.each_with_index do |line, y|
        line.each_with_index do |char, x|
          next unless char =~ SPECIAL

          coordinates_around.each do |coordinate|
            valid_positions << [x + coordinate[0], y + coordinate[1]]
          end
        end
      end

      valid_positions.uniq!

      data.each_with_index do |line, y|
        # scan for numbers
        line.join('').enum_for(:scan, NUMBER).map do |number|
          start_of_num = Regexp.last_match.begin(0)
          end_of_num = start_of_num + number.size - 1

          (start_of_num..end_of_num).each do |x|
            accepted_numbers[[x, y]] = number.to_i if valid_positions.include?([x, y])
          end
        end
      end

      accepted_numbers.each do |position, number|
        next unless accepted_numbers.keys.any? do |other_position|
          adjacent?(position,
                    other_position) && position != other_position && accepted_numbers[other_position] == number
        end

        accepted_numbers.delete(position)
      end

      accepted_numbers.values.sum
    end

    def part_2
      data = padded_data
      valid_positions = []
      possible_number_locations = {}
      gears = {}
      coordinates_around = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [-1, 1], [1, -1], [1, 0], [1, 1]]

      data.each_with_index do |line, y|
        line.each_with_index do |char, x|
          next unless char =~ STAR

          gears[[x, y]] = []
          coordinates_around.each do |coordinate|
            valid_positions << [x + coordinate[0], y + coordinate[1]]
          end
        end
      end

      valid_positions.uniq!

      data.each_with_index do |line, y|
        # scan for numbers
        line.join('').enum_for(:scan, NUMBER).map do |number|
          start_of_num = Regexp.last_match.begin(0)
          end_of_num = start_of_num + number.size - 1

          (start_of_num..end_of_num).each do |x|
            possible_number_locations[[x, y]] = number.to_i if valid_positions.include?([x, y])
          end
        end
      end

      gears.each do |gear_position, _number|
        possible_number_locations.each do |possible_number_location, number|
          next unless adjacent?(gear_position, possible_number_location)

          gears[gear_position] << { possible_number_location => number }
        end
      end

      gears.each do |gear_position, values|
        gears.delete(gear_position) if values.size == 1
        # binding.pry
        next unless gears.values.any? do |gear_values|
          gear_values.select do |gear_value|
            position = gear_value.keys.first
            number = gear_value.values.first
            binding.pry
            adjacent?(gear_position, position) && gear_position != position
          end.count > 1
        end

        puts 'deleting'
        gears.delete(gear_position)
      end

      binding.pry
      possible_number_locations.values.sum
    end

    private

    def adjacent?(position1, position2)
      (position1[0] - position2[0]).abs <= 1 && (position1[1] - position2[1]).abs <= 1
    end

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.chars
    end

    # Processes the dataset as a whole
    def process_dataset(set)
      set
    end

    def padded_data
      data.each do |line|
        line.unshift('.').push('.')
      end
      data.unshift(Array.new(data[0].size, '.')).push(Array.new(data[0].size, '.'))
      data
    end
  end
end
