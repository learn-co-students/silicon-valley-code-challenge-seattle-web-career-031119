require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

flatiron = Startup.new("Flatiron School", "Avi", "flatironschool.com")
microsoft = Startup.new("Microsoft", "Bill Gates", "microsoftware.com")
dentistscom = Startup.new("Dentists Dot Com", "Dr. Toothy", "drtoothysdentaldystopia.com")

gavin = VentureCapitalist.new("Gavin Moneyman", 8000000)
jon = VentureCapitalist.new("Jon Arbuckle", 1000000001)
lily = VentureCapitalist.new("Lily Princess", 500000000)

round1 = FundingRound.new(flatiron, gavin, "angel", 1*10**7)
round2 = FundingRound.new(microsoft, jon, "seed", 5*10**8)
round3 = FundingRound.new(dentistscom, gavin, "series A", 6*10**5)
round4 = FundingRound.new(microsoft, lily, "Series B", 5.75)
dentistscom.sign_contract(gavin, "series C", 5050501.10)
gavin.offer_contract(dentistscom, "Series D", 3.50)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
