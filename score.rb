class Score
  attr_accessor :person, :value

  def initialize(person, value)
    @person = person
    @value = value
  end

  def save
    File.open($file_path) do |j|
      @scores = JSON.load(j)
    end
    @scores << {'person': @person, 'value': @value}
    File.open($file_path, 'w') do |j|
      JSON.dump(@scores, j)
    end
  end

  def self.all
    File.open($file_path) do |j|
      return JSON.load(j)
    end
  end

  def self.delete(num)
    File.open($file_path) do |j|
      @scores = JSON.load(j)
    end
    return false if num <= 0 || num > @scores.length
    @scores.delete_at(num - 1)
    File.open($file_path, 'w') do |j|
      JSON.dump(@scores, j)
    end
    return true
  end

  def self.average
    File.open($file_path) do |j|
      @scores = JSON.load(j)
    end
    return @scores.inject(0.0){ |sum,score| sum += score['value'] } / @scores.length
  end
end
