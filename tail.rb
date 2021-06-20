require 'file-tail'

trap 'SIGINT' do
  puts 'Exiting'
  exit 1
end

ARGV.each do |a|
  puts "Argument: #{a}"
end

begin
  if ARGV.first
    class MyFile < File
      include File::Tail
    end
    log = MyFile.new(ARGV.first)
    log.backward(1).tail { |line| puts line }
  else
    p 'Usage: tail file'
  end

rescue StandardError => e
  p e
end
