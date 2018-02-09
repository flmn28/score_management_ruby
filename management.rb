require './score'
require './print'
require './validator'

class Management
  def create
    Print.normal('please enter the person')
    person = STDIN.gets.chomp
    err = Validator.check_person(person)
    return Print.invalid(err) if err
    Print.normal('please enter the score')
    value = STDIN.gets.chomp
    err = Validator.check_value(value)
    return Print.invalid(err) if err
    Score.new(person, value.to_i).save
    Print.success('Successfully created score')
  end

  def read
    Print.normal('Show all score')
    Score.all.each_with_index do |score, i|
      puts "#{i + 1}.#{score['person']},#{score['value']}"
    end
  end

  def read_as_html
    Print.normal('<h2>Show all score</h2>')
    Score.all.each_with_index do |score, i|
      puts "<p>#{i + 1}.#{score['person']},#{score['value']}</p>"
    end
  end

  def delete
    Print.normal('please enter delete line number')
    num =  STDIN.gets.chomp
    err = Validator.check_delete_line(num)
    return Print.invalid(err) if err
    if Score.delete(num.to_i)
      Print.success('Successfully deleted score')
    else
      Print.invalid('wrong number')
    end
  end

  def average
    Print.normal("Score Average: #{Score.average}")
  end
end
