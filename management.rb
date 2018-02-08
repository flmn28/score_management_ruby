require './score'
require './print'

class Management
  def create
    Print.normal('please enter the person')
    person = STDIN.gets.chomp
    return Print.invalid('should not be blank') if person.strip.empty?
    Print.normal('please enter the score')
    value = STDIN.gets.chomp
    return Print.invalid('not a number') if value.to_i.to_s != value.to_s
    return Print.invalid('less than 100') if value.to_i > 100
    return Print.invalid('more than 0') if value.to_i < 0
    Score.new(person, value.to_i).save
    Print.success('Successfully created score')
  end

  def read
    Print.normal('Show all score')
    Score.all.each_with_index do |score, i|
      puts "#{i + 1}.#{score['person']},#{score['value']}"
    end
  end

  def delete
    Print.normal('please enter delete line number')
    num =  STDIN.gets.chomp
    return Print.invalid('not a number') if num.to_i.to_s != num.to_s
    if Score.delete(num.to_i)
      Print.success('Successfully deleted score')
    else
      Print.invalid('line number is wrong')
    end
  end

  def average
    Print.normal("Score Average: #{Score.average}")
  end
end
