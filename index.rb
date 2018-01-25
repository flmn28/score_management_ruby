require 'json'
$file_path = 'scores.json'

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

class Score
  attr_accessor :score

  def initialize(score)
    @score = score
  end

  def save
    File.open($file_path) do |j|
      @scores = JSON.load(j)
    end
    @scores << @score
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
    return false if num < 0 || num > @scores.length
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
    return @scores.inject(0.0){ |sum,i| sum += i } / @scores.length
  end
end

unless File.exist?($file_path)
  File.open($file_path, 'w') do |j|
    JSON.dump([], j)
  end 
end

case ARGV[0]
when 'create', 'read', 'delete', 'average'
  Management.new.send(ARGV[0])
else
  puts ">invalid command: #{ARGV[0]} is wrong argument"
end