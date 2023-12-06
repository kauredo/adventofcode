# frozen_string_literal: true

module Year2023
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      times_victorious = []
      races = data.map do |line|
        line = line.split
        line.shift
        line.map(&:to_i)
      end.transpose

      races.each_with_index do |(time, total_distance), id|
        time.times do |i|
          distance = calculate_distance_travelled(i, time)
          times_victorious[id] = times_victorious[id].to_i + 1 if distance > total_distance
        end
      end

      times_victorious.reduce(:*)
    end

    def part_2
      time, total_distance = data.map { |line| line.scan(/\d+/).join.to_i }

      # find where calculate_distance_travelled(time_held, total_time) > total_distance
      # (time - X) * X - total_distance = 0
      # X^2 - time * X + total_distance = 0

      first_value, last_value = quadratic(1, -time, total_distance)
      (first_value.floor - last_value.floor).abs
    end

    private

    def quadratic(a, b, c) # rubocop:disable Naming/MethodParameterName
      discriminant = b**2 - 4 * a * c
      if discriminant.negative?
        nil
      elsif discriminant.zero?
        root = -b / (2 * a)
        [root, root] # One real root
      else
        root1 = (-b + Math.sqrt(discriminant)) / (2 * a)
        root2 = (-b - Math.sqrt(discriminant)) / (2 * a)
        [root1, root2] # Two real roots
      end
    end

    def calculate_distance_travelled(time_held, total_time)
      speed = time_held

      (total_time - time_held) * speed
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
