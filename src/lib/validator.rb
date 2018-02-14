class Validator
  def self.check_person(person)
    return 'should not be blank' if person.strip.empty?
    return nil
  end

  def self.check_value(value)
    return 'not a number' if value.to_i.to_s != value.to_s
    return 'less than 100' if value.to_i > 100
    return 'more than 0' if value.to_i < 0
    return nil
  end

  def self.check_delete_line(num)
    return 'should not be blank' if num.strip.empty?
    return 'not a number' if num.to_i.to_s != num.to_s
    return nil
  end
end
