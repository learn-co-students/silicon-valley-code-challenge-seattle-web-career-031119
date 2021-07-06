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
f4 = FundingRound.new(google, mera, "Angel", 100000)
f5 = FundingRound.new(flatiron, mera, "series a", 333)

puts "-----------------Funding instances-------------------"
FundingRound.all.each{|funding| p "#{funding} \n"}
p FundingRound.all.count
puts

puts "google.num_funding_rounds"
p google.num_funding_rounds

puts "google.total_funds"
p google.total_funds

puts "google.investors"
p google.investors

puts "google.big_investors"
p google.big_investors
puts
puts
puts "-------offer_contract--------"
p mera.offer_contract(google, "Happy", 10)
puts
puts "---------funding_rounds----------"
p mera.funding_rounds
puts
puts "---------portfolio----------"
p mera.portfolio
puts
puts "---------biggest_investment----------"
p mera.biggest_investment
puts
puts "---------invested----------"
p mera.invested("flatiron.com")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
