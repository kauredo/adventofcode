# frozen_string_literal: true

require 'pry'
require 'byebug'

class Solution
  def self.part_1(*input)
    new(*input).part_1
  end

  def self.part_2(*input)
    new(*input).part_2
  end

  def initialize(input)
    @input = input
  end

  def data
    @data ||= begin
      processed = @input.lines(chomp: true).map do |line|
        process_input(line) unless line.empty?
      end

      processed.length == 1 ? processed.first : process_dataset(processed)
    end
  end

  def split_data
    @split_data ||= begin
      processed = @input.split("\n\n").map do |line|
        line.split("\n").map do |item|
          process_input(item) unless item.empty?
        end
      end

      process_dataset(processed)
    end
  end

  private

  def process_input(line)
    return line.to_i if line.to_i.positive?

    line
  end

  def process_dataset(set)
    set
  end
end
