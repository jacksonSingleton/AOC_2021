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


def find_most_common_bit (arr, bit)
  zeroes = 0
  ones = 0
  arr.each do | line |
    if line[bit] == "0"
      zeroes += 1
    elsif line[bit] == "1"
      ones += 1
    end
  end
  if zeroes == ones || ones > zeroes
    return "1"
  elsif zeroes > ones
    return "0"
  end
end

def find_least_common_bit (arr, bit)
  zeroes = 0
  ones = 0
  arr.each do | line |
    if line[bit] == "0"
      zeroes += 1
    elsif line[bit] == "1"
      ones += 1
    end
  end
  if zeroes == ones || ones > zeroes
    return "0"
  elsif zeroes > ones
    return "1"
  end
end

def filter_array (arr, most_common)
  for bit in 0..$input[0].length - 2 do
    if arr.length == 1
      break
    end
    if most_common
      arr = arr.select{|byte| byte[bit] == find_most_common_bit(arr, bit)}
    else
      arr = arr.select{|byte| byte[bit] == find_least_common_bit(arr, bit)}
    end
  end
  return arr[0]
end

def part_2
    #TODO:
        # Find and keep numbers based on most common bit in each position for Oxygen levels
        # Find and keep numbers based on the least common bit in each position for the CO2 Scrubber Levels
        # Multiply levels to find life support amt.
        # We can use Gamma and Epsilon as a filter 
        oxygen_generator = filter_array($input.clone, true)
        co2_scrubber = filter_array($input.clone, false)
        puts "Oxygen Generator: #{oxygen_generator}"    
        puts "CO2 Scrubber: #{co2_scrubber}"    
        puts "Product: #{oxygen_generator.to_i(2) * co2_scrubber.to_i(2)}"
end
part_2
