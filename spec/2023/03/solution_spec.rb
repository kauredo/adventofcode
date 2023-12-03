# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2023::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2023/03/input.txt')) }
  let(:example_input) do
    <<~EOF
      12.......*..
      +.........34
      .......-12..
      ..78........
      ..*....60...
      78.........9
      .5.....23..$
      8...90*12...
      ............
      2.2......12.
      .*.........*
      1.1..503+.56
    EOF
  end

  describe 'part 1' do
    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input)).to eq(925)
      # [12 , 34 , 12 , 78 , 78 , 23 , 9 , 90 , 12 , 2 , 2 , 12 , 1 , 1 , 503 , 56]
    end

    it 'returns nil for my input' do
      expect(described_class.part_1(input)).to eq(528819)
    end
  end

  describe 'part 2' do
    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input)).to eq(nil)
    end

    it 'returns nil for my input' do
      expect(described_class.part_2(input)).to eq(nil)
    end
  end
end
