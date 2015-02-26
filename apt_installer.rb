#!/usr/bin/ruby

require 'colorize'

aptPrograms = ["mc", "vim", "aptitude", "npm", "htop", "openjdk-7-jdk", "openssh-server", "mplayer", "skype", "google-chrome-beta", "google-talkplugin", "phonon-backend-vlc", "dosbox", "ruby-compass", "ruby-sass", "git"]
successes = 0
failures = 0
errors = []


class AptInstaller
  def initialize(apts)
    @apts = apts
  end
end

puts "Running apt installer"
puts ""


puts "Adding custom repositories"

# Skype
begin
  %x[add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"]
rescue Exception => e
  puts e.message
end

# Chrome
begin
  %x[wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -]
  %x[apt-add-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"]
  %x[apt-add-repository "deb http://dl.google.com/linux/talkplugin/deb/ stable main"]
rescue Exception => e
  puts e.message
end

puts "Custom repositories added"
puts ""


puts "Updating apt"
begin
  %x[apt-get update]
rescue Exception => e
  abort e.message
end
puts "apt updated"
puts ""

total = 0
print "Installing programs: 0%"
aptPrograms.each do |program|
  total += 1
  percent = total.to_f/aptPrograms.length.to_f * 100
  print "Installing programs: #{percent.round}%"
  print "\r"

  begin
    %x[apt-get -y install #{program}]
    successes += 1
  rescue Exception => e
    errors.push("Installation failed for '#{program}', the message was: #{e.message}")
    failures += 1
  end
end
puts "Programs installed"
puts ""

puts "Cleaning up"
begin
  %x[apt-add-repository -r "deb http://dl.google.com/linux/chrome/deb/ stable main"]
  %x[apt-add-repository -r "deb http://dl.google.com/linux/talkplugin/deb/ stable main"]
rescue Exception => e
  puts "Failed cleaning the google setup"
end
puts ""

totalRuns = failures+successes
puts "Installation script at the end"
puts "Installer had #{failures.to_s().red()} and #{successes.to_s().green()} successes."

if errors.length
  errors.each do |error|
    puts error
  end
end

puts "Ran #{totalRuns.to_s().blue()} installations"
