# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2023::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2023/01/input.txt')) }
  let(:example_input) do
    <<~EOF
      two1nine
      eightwo
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
    EOF
  end

  describe 'part 1' do
    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input)).to eq(209)
    end

    it 'returns nil for my input' do
      expect(described_class.part_1(input)).to eq(55090)
    end
  end

  describe 'part 2' do
    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input)).to eq(280)
    end

    it 'returns nil for my input' do
      expect(described_class.part_2(input)).to eq(54845)
    end
  end
end
