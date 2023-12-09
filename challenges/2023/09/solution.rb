# frozen_string_literal: true

module Year2023
  class Day09 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      game = data.map do |line|
        new_line = calculate_diffs([line])

        new_line.reverse.map.with_index do |l, i|
          if i.zero?
            l.push(0)
          else
            l.push(l.last + new_line.reverse[i - 1].last)
          end
        end
      end

      game.map(&:last).map(&:last).sum
    end

    def part_2
      game = data.map do |line|
        new_line = calculate_diffs([line])

        new_line.reverse.map.with_index do |l, i|
          if i.zero?
            l.unshift(0)
          else
            l.unshift(l.first - new_line.reverse[i - 1].first)
          end
        end
      end

      game.map(&:last).map(&:first).sum
    end

    private

    def calculate_diffs(lines)
      line = lines.last
      line_diff = []
      (line.size - 1).times do |i|
        line_diff << line[i + 1] - line[i]
      end

      lines.push(line_diff)

      if line_diff.all?(&:zero?)
        lines
      else
        calculate_diffs(lines)
      end
    end

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split.map(&:to_i)
    end

    # Processes the dataset as a whole
    def process_dataset(set)
      set
    end
  end
end
