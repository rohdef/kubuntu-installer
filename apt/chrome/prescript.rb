# Chrome
begin
  %x[wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -]
  %x[apt-add-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"]
  %x[apt-add-repository "deb http://dl.google.com/linux/talkplugin/deb/ stable main"]
rescue Exception => e
  puts e.message
end
