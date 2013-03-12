#!/usr/bin/ruby

require 'colorize'

gemPrograms = []
successes = 0
failures = 0
errors = []

puts "Running gem installer"
puts ""


# gem update system
puts "Updating gem"
begin
  # Disabled on Debian systems
  #%x[gem update --system]
rescue Exception => e
  abort e.message
end
puts "gem updated"
puts ""

total = 0
print "Installing programs: 0%"
gemPrograms.each do |program|
  total += 1
  percent = total.to_f/gemPrograms.length.to_f * 100
  print "Installing programs: #{percent.round}%"
  print "\r"

  begin
    %x[gem install #{program}]
    successes += 1
  rescue Exception => e
    errors.push("Installation failed for '#{program}', the message was: #{e.message}")
    failures += 1
  end
end
puts "Programs installed"
puts ""

totalRuns = failures+successes
puts "gem installation script at the end"
puts "Installer had #{failures.to_s().red()} and #{successes.to_s().green()} successes."

if errors.length
  errors.each do |error|
    puts error
  end
end

puts "Ran #{totalRuns.to_s().blue()} installations"
