begin
  %x[add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"]
rescue Exception => e
  puts e.message
end
