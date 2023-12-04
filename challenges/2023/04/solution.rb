module Year2023
  class Day04 < Solution
    def part_1
      data.sum do |line|
        my_numbers, game_numbers = line.split('|')
        my_numbers = my_numbers.split(':').last.strip.split(' ').map(&:to_i)
        game_numbers = game_numbers.strip.split(' ').map(&:to_i)

        winning_numbers = my_numbers & game_numbers

        if winning_numbers.empty?
          0
        else
          count = winning_numbers.count

          temp_sum = 0
          count.times do |i|
            if i.zero?
              temp_sum += 1
            else
              temp_sum *= 2
            end
          end
          temp_sum
        end
      end
    end

    def part_2
      # Initialize a new hash with default values as empty arrays
      card_winnings = Hash.new { |h, k| h[k] = [] }

      # Iterating over each line of data
      data.each do |line|
        # Splitting the line into my_numbers and game_numbers
        my_numbers, game_numbers = line.split('|')

        # Extracting game_id from my_numbers and converting it to an integer
        game_id = my_numbers.split(':').first.gsub('Card ', '').to_i

        # Converting my_numbers and game_numbers into arrays of integers
        my_numbers = my_numbers.split(':').last.strip.split(' ').map(&:to_i)
        game_numbers = game_numbers.strip.split(' ').map(&:to_i)

        # Finding the common numbers in my_numbers and game_numbers
        winning_numbers = my_numbers & game_numbers

        # Skip the rest of the loop if there are no winning numbers
        next if winning_numbers.empty?

        # For each winning number, add game_id + i + 1 to the card_winnings hash
        winning_numbers.count.times do |i|
          card_winnings[game_id] << game_id + i + 1
        end
      end

      # Calculate total winnings per card
      total_winnings_per_card = Hash.new { |h, k| h[k] = [] }
      card_winnings.to_a.sort.reverse.each do |card_id, winnings|
        total_winnings_per_card[card_id] += winnings
        winnings.each do |winning_id|
          total_winnings_per_card[card_id] += total_winnings_per_card[winning_id]
        end
      end

      # The final result is the count of all winnings plus the count of data lines
      total_winnings_per_card.values.flatten.count + data.count
    end

    private

    def process_input(line)
      line
    end

    def process_dataset(set)
      set
    end
  end
end
