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
    Printer.success('created score')
  end

  def read
    Printer.normal('Show all score')
    Score.all.each_with_index do |score, i|
      Printer.raw("#{read_template(score, i)}")
    end
  end

  def read_as_html
    Printer.normal('<h2>Show all score</h2>')
    Score.all.each_with_index do |score, i|
      Printer.raw("<p>#{read_template(score, i)}</p>")
    end
  end

  def delete
    Printer.normal('please enter delete line number')
    num = input('delete_line')
    return if num.nil?
    Score.delete(num.to_i) ? Printer.success('deleted score') : Printer.invalid('wrong number')
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

    def read_template(score, i)
      "#{i + 1}.#{score['person']},#{score['value']}"
    end
end
