require './src/app/score'
require './src/lib/printer'
require './src/lib/validator'

class Management
  def create
    Printer.normal('please enter the person')
    person = STDIN.gets.chomp
    err = Validator.check_person(person)
    return Printer.invalid(err) if err
    Printer.normal('please enter the score')
    value = STDIN.gets.chomp
    err = Validator.check_value(value)
    return Printer.invalid(err) if err
    Score.new(person, value.to_i).save
    Printer.success('Successfully created score')
  end

  def read
    Printer.normal('Show all score')
    Score.all.each_with_index do |score, i|
      puts "#{i + 1}.#{score['person']},#{score['value']}"
    end
  end

  def read_as_html
    Printer.normal('<h2>Show all score</h2>')
    Score.all.each_with_index do |score, i|
      puts "<p>#{i + 1}.#{score['person']},#{score['value']}</p>"
    end
  end

  def delete
    Printer.normal('please enter delete line number')
    num =  STDIN.gets.chomp
    err = Validator.check_delete_line(num)
    return Printer.invalid(err) if err
    if Score.delete(num.to_i)
      Printer.success('Successfully deleted score')
    else
      Printer.invalid('wrong number')
    end
  end

  def average
    Printer.normal("Score Average: #{Score.average}")
  end
end
