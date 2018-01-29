require './score'

class Management
  def create
    puts '>please enter the score'
    score = STDIN.gets.chomp
    return puts '>invalid input: not a number' if score.to_i.to_s != score.to_s
    return puts '>invalid input: less than 100' if score.to_i > 100
    return puts '>invalid input: more than 0' if score.to_i < 0
    Score.new(score.to_i).save
    puts '>Successfully created score'
  end

  def read
    puts '>Show all score'
    Score.all.each_with_index do |score, i|
      puts "#{i + 1}.#{score}"
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