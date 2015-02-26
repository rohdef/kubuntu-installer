#!/usr/bin/ruby
require("json")
require("./apt_installer")

apt = Array.new()
aptDirs = Dir['apt/*/']
gemDirs = Dir['gem/*/']
npmDirs = Dir['npm/*/']

aptDirs.each do |aptDir|
  puts aptDir
  file = File.read(aptDir + '/config.json')
  apt << JSON.parse(file)
  apt['path'] = aptDir
end

foo = new AptInstaller(apt)
