require './src/app/score'
require './src/lib/printer'
require './src/lib/validator'

class Management
  def create
    Printer.normal('please enter the person')
    person = input('person')
    return if person.nil?
    Printer.normal('please enter the score')
    value = input('value')
    return if value.nil?
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
    num = input('delete_line')
    return if num.nil?
    Score.delete(num.to_i) ? Printer.success('Successfully deleted score') : Printer.invalid('wrong number')
  end

  def average
    Printer.normal("Score Average: #{Score.average}")
  end

  private
    def input(type)
      input = STDIN.gets.chomp
      err = Validator.send("check_#{type}", input)
      if err
        Printer.invalid(err)
        return nil
      end
      return input
    end
end
