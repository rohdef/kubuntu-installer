#!/usr/bin/ruby

require 'colorize'

npmPrograms = ["buster"]
successes = 0
failures = 0
errors = []

puts "Running npm installer"
puts ""

total = 0
print "Installing programs: 0%"
npmPrograms.each do |program|
  total += 1
  percent = total.to_f/npmPrograms.length.to_f * 100
  print "Installing programs: #{percent.round}%"
  print "\r"

  begin
    %x[npm -g install #{program}]
    successes += 1
  rescue Exception => e
    errors.push("Installation failed for '#{program}', the message was: #{e.message}")
    failures += 1
  end
end
puts "Programs installed"
puts ""

totalRuns = failures+successes
puts "npm installation script at the end"
puts "Installer had #{failures.to_s().red()} and #{successes.to_s().green()} successes."

if errors.length
  errors.each do |error|
    puts error
  end
end

puts "Ran #{totalRuns.to_s().blue()} installations"
