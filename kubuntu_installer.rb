#!/usr/bin/ruby
require("json")
require("./apt_installer")

apt = Array.new()
aptDirs = Dir['apt/*/']
gemDirs = Dir['gem/*/']
npmDirs = Dir['npm/*/']

aptDirs.each do |aptDir|
  file = File.read(aptDir + '/config.json')
  aptDetails = JSON.parse(file)
  aptDetails['path'] = aptDir
  apt << aptDetails
end

foo = AptInstaller.new(apt)
foo.install()