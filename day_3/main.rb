

$input = File.readlines('input.txt')


def part_1
    gamma = ""
    zeroes = 0
    ones = 0
    epsilon = ""
    for i in 0..$input[0].length-2 
        $input.each do |line|
            if line[i] == "0"
                zeroes += 1 
            elsif line[i] == "1"
                ones += 1
            end
        end
        if zeroes == ones
            gamma += "1"
        end
        gamma += (zeroes > ones ? '0' : '1')
        zeroes = 0
        ones = 0
    end
    gamma.each_char do | char |
        if char == '0'
            epsilon += '1'
        else
            epsilon += '0'
        end
    end
    puts "Gamma: #{gamma} "
    puts "Epsilon: #{epsilon}"
    puts "Product: #{gamma.to_i(2) * epsilon.to_i(2)}"
    return [gamma, epsilon]
end


def filter_array (arr, filter)
        filter.each_char.with_index do | bit, idx|
            if arr.length === 1
                break
            end
            arr = arr.select { | pwr | pwr[idx] == bit}
            #puts "Number of Possible Solutions: #{arr.length}\nIterations: #{idx + 1}"
        end
        return arr[0]
end
def part_2
    #TODO:
        # Find and keep numbers based on most common bit in each position for Oxygen levels
        # Find and keep numbers based on the least common bit in each position for the CO2 Scrubber Levels
        # Multiply levels to find life support amt.
        # We can use Gamma and Epsilon as a filter 
        filters = part_1
        gamma = filters[0]
        epsilon = filters[1]

        oxygen_generator = filter_array($input.clone, gamma)
        co2_scrubber = filter_array($input.clone, epsilon)
 
        puts "Oxygen Generator: #{oxygen_generator}"    
        puts "CO2 Scrubber: #{co2_scrubber}"    
        puts "Product: #{oxygen_generator.to_i(2) * co2_scrubber.to_i(2)}"
end
part_2