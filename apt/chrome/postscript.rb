# Cleaning up
begin
  %x[apt-add-repository -r "deb http://dl.google.com/linux/chrome/deb/ stable main"]
  %x[apt-add-repository -r "deb http://dl.google.com/linux/talkplugin/deb/ stable main"]
rescue Exception => e
  puts "Failed cleaning the google setup"
end
