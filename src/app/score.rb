class Score
  attr_accessor :person, :value

  def initialize(person, value)
    @person = person
    @value = value
  end

  def save
    scores = self.class.all
    scores << {'person': @person, 'value': @value}
    self.class.save(scores)
  end

  def self.all
    File.open($file_path) do |j|
      return JSON.load(j)
    end
  end

  def self.delete(num)
    scores = self.all
    return false if num <= 0 || num > scores.length
    scores.delete_at(num - 1)
    self.save(scores)
    return true
  end

  def self.average
    scores = self.all
    return scores.inject(0.0){ |sum,score| sum += score['value'] } / scores.length
  end

  private
    def self.save(scores)
      File.open($file_path, 'w') do |j|
        JSON.dump(scores, j)
      end
    end
end
