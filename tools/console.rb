require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

google = Startup.new("Google", "Mr. Google", "google.com")
flatiron = Startup.new("Flatiron", "Avi", "flatiron.com")

puts "-----------------Startup instances-------------------"
p Startup.all
puts

mera = VentureCapitalist.new("mera", 400000)
joe = VentureCapitalist.new("joe", 1000000000)

puts "-----------------VC instances-------------------"
p VentureCapitalist.all
puts

f1 = FundingRound.new(google, mera, "seed", 300000)
f2 = FundingRound.new(google, joe, "Angel", 500000)
f3 = FundingRound.new(flatiron, joe, "series a", 1000000)

puts "-----------------Funding instances-------------------"
FundingRound.all.each{|funding| p "#{funding} \n"}
p FundingRound.all.count
puts



binding.pry
0 #leave this here to ensure binding.pry isn't the last line
