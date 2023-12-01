# frozen_string_literal: true

module Year2022
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      count = 0
      new_data = process_data

      new_data.each do |line|
        count += 1 if (line[0] - line[1]).empty? || (line[1] - line[0]).empty?
      end
      count
    end

    def part_2
      count = 0
      new_data = process_data

      new_data.each do |line|
        count += 1 unless (line[0] & line[1]).empty? && (line[1] & line[0]).empty?
      end
      count
    end

    private

    def process_data
      data = @input.split("\n")
      data.map do |line|
        line.split(',').map do |elf|
          elf.split('-').map(&:to_i)
        end.map do |a, b|
          (a..b).to_a
        end
      end
    end
  end
end
