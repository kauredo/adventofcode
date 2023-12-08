# frozen_string_literal: true

module Year2023
  class Day08 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    LETTERS = /([A-Z])\1+/.freeze
    def part_1
      clean_data = data.dup
      game_map = {}
      directions = clean_data.shift.split('').cycle
      start = 'AAA'
      finish = /ZZZ/
      found = false
      clean_data.shift

      clean_data.each do |line|
        line = line.split(' = ')
        key = line.first
        values = line.last.gsub('(', '').gsub(')', '').split(', ')
        game_map[key] = values
      end

      times = 0
      start, times, found = find_next(start, finish, game_map, times, directions) until found

      times
    end

    def part_2
      clean_data = data.dup
      game_map = {}
      directions = clean_data.shift.split('').cycle
      clean_data.shift

      clean_data.each do |line|
        line = line.split(' = ')
        key = line.first
        values = line.last.gsub('(', '').gsub(')', '').split(', ')
        game_map[key] = values
      end

      starting_keys = game_map.keys.select do |key|
        key[-1] == 'A'
      end

      z_times = []
      starting_keys.each do |start|
        found = false
        times = 0

        finish = /(\w+)Z/
        start, times, found = find_next(start, finish, game_map, times, directions) until found

        z_times << times
      end

      z_times.reduce { |a, b| a.lcm(b) }
    end

    private

    def find_next(start, finish, game_map, times, directions)
      times += 1
      game_values = game_map[start]

      direction = directions.next

      start = if direction == 'L'
                game_values.first
              else
                game_values.last
              end

      [start, times, start =~ finish]
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
