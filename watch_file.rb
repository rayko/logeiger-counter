require "gosu"
require 'rb-inotify'
require 'yaml'

config = {}
config = YAML.load_file('config.yml') if File.exist?('config.yml')

puts 'Configuration:'
puts config.inspect

puts "\nSounds found:"
Dir["#{config[:sounds_dir]}/*.wav"].each { |snd| puts "- #{snd}" }
puts ''

filename = ARGV[0]

if filename.nil? || filename == ''
  puts 'No file provided'
  puts ''
  puts 'Usage: ruby watch_file.rb <filepath>'
end

@snds = []

Dir["#{config[:sounds_dir]}/*.wav"].each do |snd|
  @snds << Gosu::Sample.new(snd)
end

open(filename) do |file|
  file.read
  queue = INotify::Notifier.new
  queue.watch(filename, :modify) do
    file.read.split("\n").each do |line| 
      puts line
    end
    @snds.shuffle.first.play(0.3) unless @snds.empty?
  end
  queue.run
end

