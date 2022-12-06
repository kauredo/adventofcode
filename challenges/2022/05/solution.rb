# frozen_string_literal: true
module Year2022
  class Day05 < Solution

    def part_1
      @crates = {}
      @moves = []
      setup

      @moves.each do |count, from, to|
        count.times do
          moved = @crates[from].pop
          @crates[to] << moved
        end
      end
      @crates.to_a.sort.map do |col_num, letters|
        letters.last
      end.join
    end

    def part_2
      @crates = {}
      @moves = []
      setup

      @moves.each do |count, from, to|
        moved = @crates[from].pop(count)
        @crates[to] += moved
      end

      @crates.to_a.sort.map do |col_num, letters|
        letters.last
      end.join
    end

    private

    def setup
      lines = @input.split("\n")
      numbers_idx = lines.map(&:to_i).index(1)
      cols = lines[numbers_idx].split.count
      crates_list = lines.first(numbers_idx)
      moves_list = lines - lines.first(numbers_idx + 2)

      setup_crates(crates_list)
      setup_moves(moves_list)

      cols.times do |col|
        @crates[col + 1] = @crates[col + 1].reverse
      end
    end

    def setup_crates(crates_list)
      crates_list.each do |row|
        row = row.gsub("[", "").gsub("]", "").gsub("    ", "-").gsub(" ", "")

        row.split("").each_with_index do |letter, index|
          if letter != "-"
            @crates[index + 1] = [] if @crates[index + 1].nil?
            @crates[index + 1] << letter
          end
        end
      end
    end

    def setup_moves(moves_list)
      moves_list.map do |row|
        @moves << row.split.map(&:to_i).delete_if {|item| item == 0}
      end
    end
  end
end
