#!/usr/bin/ruby
require("json")

apt = Array.new()
aptDirs = Dir['apt/*/']
gemDirs = Dir['gem/*/']
npmDirs = Dir['npm/*/']

aptDirs.each do |aptDir|
  puts aptDir
  file = File.read(aptDir + '/config.json')
  apt << JSON.parse(file)
end

apt.each do |apt|
  puts "#{apt['package']}"
end
