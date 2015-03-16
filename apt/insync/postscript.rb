begin
  # something wrong, fix it bastard
#  %[mkdir /home/rohdef/studies]

  File.open("/etc/fstab", "a") { |d|
    File.open("fstab", "r") { |s|
      s.each_line do |line|
        d.puts(line)
      end
    }
  }
rescue

end
