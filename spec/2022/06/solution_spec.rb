# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day06 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/06/input.txt')) }
  let(:example_input_1) { 'mjqjpqmgbljsphdztnvjfqwrcgsmlb' }
  let(:example_input_2) { 'bvwbjplbgvbhsrlpgdmjqwftvncz' }
  let(:example_input_3) { 'nppdvjthqldpwncqszvftbrmjlhg' }
  let(:example_input_4) { 'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg' }
  let(:example_input_5) { 'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw' }

  describe 'part 1' do
    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input_1)).to eq(7)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input_2)).to eq(5)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input_3)).to eq(6)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input_4)).to eq(10)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input_5)).to eq(11)
    end

    it 'returns nil for my input' do
      expect(described_class.part_1(input)).to eq(nil)
    end
  end

  describe 'part 2' do
    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input_1)).to eq(19)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input_2)).to eq(23)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input_3)).to eq(23)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input_4)).to eq(29)
    end

    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input_5)).to eq(26)
    end

    it 'returns nil for my input' do
      expect(described_class.part_2(input)).to eq(nil)
    end
  end
end
