# frozen_string_literal: true

module Year2023
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file
    POSSIBILITIES = {
      red: 12,
      green: 13,
      blue: 14
    }.freeze

    def part_1
      count = 0
      data.each do |line|
        game_id, attempts = parse_line(line)
        game = process_attempts(attempts)

        count += game_id if game.all?
      end

      count
    end

    def part_2
      solution = {}
      data.each do |line|
        game_id, attempts = parse_line(line)
        process_attempts_for_solution(attempts, solution, game_id)
      end

      calculate_final_solution(solution)
    end

    private

    def parse_line(line)
      id, attempts_data = line.split(':')
      game_id = id.gsub('Game ', '').to_i
      attempts = attempts_data.split(';').map(&:strip)

      [game_id, attempts]
    end

    def process_attempts(attempts)
      attempts.map do |attempt|
        colors = attempt.split(',').map(&:strip)

        colors.map do |color_number|
          color, number = parse_color_number(color_number)

          number <= POSSIBILITIES[color]
        end.all?
      end
    end

    def parse_color_number(color_number)
      number, color = color_number.split
      [color.to_sym, number.to_i]
    end

    def process_attempts_for_solution(attempts, solution, game_id)
      attempts.each do |attempt|
        colors = attempt.split(',').map(&:strip)

        colors.each do |color_number|
          color, number = parse_color_number(color_number)

          solution[game_id] ||= { red: [], green: [], blue: [] }
          solution[game_id][color] << number
        end
      end
    end

    def calculate_final_solution(solution)
      solution.values.map do |game|
        game.values.map(&:max).inject(:*)
      end.sum
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
