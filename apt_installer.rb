#!/usr/bin/ruby

require 'colorize'

class AptInstaller
  def initialize(apts)
    @apts = apts
    @successes = 0
    @failures = 0
    @errors = []
  end

  def prepare()
    # Update apt before we run amok
    begin
      %x[apt-get update]
    rescue Exception => e
      abort e.message
    end
  end

  def install()
    total = 0
    percent = 0.0
    errors = []
    successes = 0
    failures = 0

    print "Preconfiguring programs to install: 0%\n"
    @apts.each do |program|
      total += 1
      percent = total.to_f/@apts.length.to_f * 100
      print "Preconfiguring programs: #{percent.round}%\n"

      if File.exist?(program['path'] + '/prescript.rb')
        print "\tPreconfiguring #{program['title']}\n"
        require "./" + program['path'] + '/prescript.rb'
      end
    end

    self.prepare()

    print "Preconfiguration done\n"
    print "---------------------\n\n"

    total = 0
    
    print "Installing programs: 0%\n"
    @apts.each do |program|
      total += 1
      percent = total.to_f/@apts.length.to_f * 100
      print "Installing programs: #{percent.round}%\n"
      print "Installing #{program['title']}\n"
      
      begin
        %x[apt-get -y install #{program['package']}]
        successes += 1
      rescue Exception => e
        errors.push("Installation failed for '#{program}', the message was: #{e.message}")
        failures += 1
      end
    end

    print "Installation done\n"
    print "-----------------\n\n"

    total = 0
    
    print "Postconfiguring programs to install: 0%\n"
    @apts.each do |program|
      total += 1
      percent = total.to_f/@apts.length.to_f * 100
      print "Postconfiguring programs: #{percent.round}%\n"

      if File.exist?(program['path'] + '/postscript.rb')
        print "\tPostconfiguring #{program['title']}\n"
        require "./" + program['path'] + '/postscript.rb'
      end
    end

    print "Postconfiguration done\n"
    print "---------------------\n\n"
  end
end

#puts "Installation script at the end"
#puts "Installer had #{failures.to_s().red()} and #{successes.to_s().green()} successes."

#if errors.length
#  errors.each do |error|
#    puts error
#  end
#end

#puts "Ran #{totalRuns.to_s().blue()} installations"
