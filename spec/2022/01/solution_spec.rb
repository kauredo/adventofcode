# frozen_string_literal: true
require 'spec_helper'
require 'pry'

RSpec.describe Year2022::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/01/input.txt")) }
  let(:example_input) {
    <<~EOF
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    EOF
  }

  describe "part 1" do
    it "returns correct value for the example input" do
      expect(described_class.part_1(example_input)).to eq(24000)
    end

    it "returns correct value for my input" do
      expect(described_class.part_1(input)).to eq(69289)
    end
  end

  describe "part 2" do
    it "returns correct value for the example input" do
      expect(described_class.part_2(example_input)).to eq(45000)
    end

    it "returns correct value for my input" do
      expect(described_class.part_2(input)).to eq(205615)
    end
  end
end
