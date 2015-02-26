begin
  %x[add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"]
rescue Exception => e
  puts e.message
end
