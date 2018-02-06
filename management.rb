require './score'

class Management
  def create
    puts '>please enter the person'
    person = STDIN.gets.chomp
    return puts '>invalid input: should not be blank' if person.strip.empty?
    puts '>please enter the score'
    value = STDIN.gets.chomp
    return puts '>invalid input: not a number' if value.to_i.to_s != value.to_s
    return puts '>invalid input: less than 100' if value.to_i > 100
    return puts '>invalid input: more than 0' if value.to_i < 0
    Score.new(person, value.to_i).save
    puts '>Successfully created score'
  end

  def read
    puts '>Show all score'
    Score.all.each_with_index do |score, i|
      puts "#{i + 1}.#{score['person']},#{score['value']}"
    end
  end

  def delete
    puts '>Please enter delete line number'
    num =  STDIN.gets.chomp
    return puts '>invalid input: not a number' if num.to_i.to_s != num.to_s
    if Score.delete(num.to_i)
      puts '>Successflly deleted score'
    else
      puts '>invalid input: line number is wrong'
    end
  end

  def average
    puts ">Score Average: #{Score.average}"
  end
end
