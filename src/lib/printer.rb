class Printer
  def self.normal(message)
    puts ">#{message}"
  end

  def self.success(message)
    puts "\e[32m>#{message}\e[0m"
  end

  def self.invalid(message)
    puts "\e[31m>invalid input: #{message}\e[0m"
  end
end
