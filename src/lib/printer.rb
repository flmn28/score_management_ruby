class Printer
  def self.raw(message)
    puts "#{message}"
  end

  def self.normal(message)
    puts ">#{message}"
  end

  def self.success(message)
    puts "\e[32m>Successfully #{message}\e[0m"
  end

  def self.invalid(message)
    puts "\e[31m>invalid input: #{message}\e[0m"
  end
end
