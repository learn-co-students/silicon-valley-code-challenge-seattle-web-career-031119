#Has many FundingRound
#Has many VentureCapitalist through FundingRound
require "pry"
class Startup

  attr_reader :name, :founder, :domain

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

  def sign_contact(venture_capitalist, type, amount)
    FundingRound.new(self, venture_capitalist, type, amount)
  end

  def funding_rounds
    FundingRound.all.select{|round| round.startup == self}
  end

  def num_funding_rounds
    self.funding_rounds.count
  end

  def total_funds
    investments = self.funding_rounds.map{|round| round.investment}
    total = 0

    investments.each do |investment|
      total += investment
    end

    total

  end

  def investors
    self.funding_rounds.map {|round| round.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
  end

  def self.find_by_founder(founder)
    self.all.select {|startup| startup.founder == founder}
  end

  def self.domains
    self.all.map {|startup| startup.domain}.uniq
  end

  def self.all
    @@all
  end

end
