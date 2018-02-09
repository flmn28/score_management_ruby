require 'json'
require './management'

$file_path = 'scores.json'

unless File.exist?($file_path)
  File.open($file_path, 'w') do |j|
    JSON.dump([], j)
  end
end

case ARGV[0]
when 'create', 'read', 'delete', 'average', 'read_as_html'
  Management.new.send(ARGV[0])
else
  puts ">invalid command: wrong argument"
end
