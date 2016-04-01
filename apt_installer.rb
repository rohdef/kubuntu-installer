#!/usr/bin/ruby

require 'colorize'

#aptPrograms = "google-talkplugin", "phonon-backend-vlc"]

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
    
    print "Running prescripts: 0% \n"
    @apts.each do |program|
      total += 1
      percent = total.to_f/@apts.length.to_f * 100
      print "Running prescripts: #{percent.round}%\n"
      print "Prescript for #{program['title']}\n"

      if File.exist?("#{program['path']}prescript.rb")
          out = %x[ruby #{program['path']}prescript.rb]
          print(out)
      end
    end
    
    total = 0
    percent = 0.0
    
    %x[apt-get update]
    
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
    
    total = 0
    percent = 0.0
    
    @apts.each do |program|
      total += 1
      percent = total.to_f/@apts.length.to_f * 100
      print "Running postscripts: #{percent.round}%\n"
      print "Postscript for #{program['title']}\n"
      
      if File.exist?("#{program['path']}postcript.rb")
          out = %x[ruby #{program['path']}postcript.rb]
          print(out)
      end
    end
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
