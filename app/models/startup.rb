class Startup

  attr_accessor :name, :founder
  attr_reader :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    @@all.select {|startup|
      startup.founder == founder
    }
  end

  def self.domains
    @@all.collect {|startup|
      startup.domain
    }
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.startup == self}
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    total = 0
    funding_rounds.each {|round| total += round.investment}
    total
  end

  def investors
    funding_rounds.collect {|round| round.venture_capitalist}.uniq
  end

  def big_investors
    investors.select do |vc|
      vc.total_worth > 999999999
    end
  end

end
