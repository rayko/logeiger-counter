require "gosu"
require 'rb-inotify'

filename = ARGV[0]

if filename.nil? || filename == ''
  puts 'No file provided'
  puts ''
  puts 'Usage: ruby watch_file.rb <filepath>'
end

@snds = []
@snds << Gosu::Sample.new('sounds/click.wav')
@snds << Gosu::Sample.new('sounds/click2.wav')
@snds << Gosu::Sample.new('sounds/click3.wav')

open(filename) do |file|
  file.read
  queue = INotify::Notifier.new
  queue.watch(filename, :modify) do
    file.read.split("\n").each do |line| 
      puts line
    end
    @snds.shuffle.first.play(0.3)
  end
  queue.run
end

