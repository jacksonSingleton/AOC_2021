
$input = File.readlines('input.txt')


def part_1 
    vert = 0
    hori = 0
    $input.each do |command|
        if command.include?('up')
            vert -= command.split(' ')[1].to_i
        elsif command.include?('down')
            vert += command.split(' ')[1].to_i
        elsif command.include?('forward')
            hori += command.split(' ')[1].to_i
        end
    end
    puts "ANS: #{vert * hori}"
end
def part_2
    vert = 0
    hori = 0
    aim = 0
    $input.each do |command|
        if command.include?('up')
            aim -= command.split(' ')[1].to_i
        elsif command.include?('down')
            aim += command.split(' ')[1].to_i
        elsif command.include?('forward')
            hori += command.split(' ')[1].to_i
            vert += command.split(' ')[1].to_i * aim
        end
    end
    puts "ANS: #{vert * hori}"
end
part_2