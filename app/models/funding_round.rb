class FundingRound
  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist
  @@all = [ ]

  def self.all
    @@all
  end

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment
    @@all << self
  end

end
