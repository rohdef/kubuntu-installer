# Chrome
begin
  %x[wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | apt-key add -]
  %x[apt-add-repository "deb http://apt.insynchq.com/ubuntu $(lsb_release -sc) non-free contrib"]
rescue Exception => e
  puts e.message
end
