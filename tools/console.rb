require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

amazon = Startup.new("Amazon", "Jeff Bezos", "amazon.com")
apple = Startup.new("Apple", "Steve Jobs", "mac.com")
windows = Startup.new("Windows", "Bill Gates", "netscape.org")


jeff_bezos = VentureCapitalist.new("Jeff Bezos",20)
dr_doolittle = VentureCapitalist.new("Dr. Doolittle",30000000000)

round1 = FundingRound.new(amazon, dr_doolittle, "angel", 1)
round2 = FundingRound.new(apple, jeff_bezos, "angel", 20)

windows.sign_contact(dr_doolittle, "seed", 1000000000)
windows.sign_contact(jeff_bezos, "seed", 1)


jeff_bezos.offer_contract(windows, "first",15)

dr_doolittle.offer_contract(apple,"second",1500)






binding.pry
0 #leave this here to ensure binding.pry isn't the last line
