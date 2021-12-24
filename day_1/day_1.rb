

$input = File.readlines('input.txt')

def part_1
    # open file named input.txt and read each line into an array
    increases = 0
    $input.each_with_index do |line, idx|
        if idx == 0
            next
        end
        currentLine = line.to_i
        prevLine = $input[idx - 1].to_i
        if currentLine > prevLine
            increases += 1
        end 
        puts "Increases: #{increases}"
    end
end
def part_2
    increases = 0
    $input.each_with_index do |line, idx|
        #Create a comparison group at current index and then create a comparitior group at the next index
        window_a = $input[idx..idx+2].map(&:to_i).sum
        window_b = $input[idx+1..idx+3].map(&:to_i).sum
        if window_b.to_i > window_a.to_i
            increases += 1
        end
        puts increases
    end
end

part_2
