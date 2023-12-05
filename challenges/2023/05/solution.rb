# frozen_string_literal: true

module Year2023
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      game_map = Hash.new { |h, k| h[k] = [] }
      lines = data.dup
      seeds = lines.shift.split(': ')[1].split(' ').map(&:to_i)
      game_path = []

      set_game_map(game_map, game_path, lines)

      final_map = seeds.map do |seed|
        start = seed
        game_path.each do |(source, destination)|
          values = game_map[[source, destination]].sort_by { |(s, _d, _l)| s }
          start = next_min_value(start, values)
        end
        [seed, start]
      end

      final_map.min_by { |_k, v| v }.last
    end

    def part_2
      game_map = Hash.new { |h, k| h[k] = [] }
      lines = data.dup
      seeds = lines.shift.split(': ')[1].split(' ').map(&:to_i).each_slice(2).to_a
      game_path = []

      set_game_map(game_map, game_path, lines)

      # for each seed range, find the minimum value after mapping the game
      path = Hash.new { |h, k| h[k] = [] }
      final_map = seeds.map do |seed|
        start, len = seed

        seed_range = (start...start + len)
        seed_range.map do |s|
          start = s
          game_path.each do |(source, destination)|
            values = game_map[[source, destination]].sort_by { |(s, _d, _l)| s }
            start = next_min_value(start, values)
            path[s] << start
          end
          [s, start]
        end
      end
      binding.pry
      final_map.flatten(1).min_by { |_k, v| v }.last
    end

    private

    def set_game_map(game_map, game_path, lines)
      current_maps = nil
      lines.map do |line|
        next if line.nil?

        if line.include?('map')
          current_maps = line.split(' ').first.split('-to-')
          game_path << current_maps
          next
        end

        destination, source, length = line.split(' ').map(&:to_i)

        game_map[current_maps] << [source, destination, length]
      end
    end

    def next_min_value(start, values)
      s, d, l = values.find do |(s, _d, l)|
        (s..s + l).include?(start)
      end

      if s == start
        d
      elsif s.nil?
        start
      elsif (s..s + l).include?(start)
        start + (d - s)
      else
        start
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
