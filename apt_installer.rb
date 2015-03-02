#!/usr/bin/ruby

require 'colorize'

aptPrograms = ["mc", "vim", "aptitude", "npm", "htop", "openjdk-7-jdk", "openssh-server", "mplayer", "skype", "google-chrome-beta", "google-talkplugin", "phonon-backend-vlc", "dosbox", "ruby-compass", "ruby-sass", "git"]

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
    print "Installing programs: 0%"
    @apts.each do |program|
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
