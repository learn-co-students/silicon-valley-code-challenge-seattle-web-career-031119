class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = [ ]

  def self.all
    @@all
  end

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(new_domain, new_name)
    @domain = new_domain
    @name = new_name
  end

  def self.find_by_founder(search_founder)
    self.all.find { |startup| startup.founder == search_founder }
  end

  def self.domains
    self.all.map { |startup| startup.domain }
  end

  def sign_contract(vc, type, investment)
    FundingRound.new(self, vc, type, investment.to_f)
  end

  def funding_rounds
    FundingRound.all.select { |round| round.startup == self }
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    sum = 0
    funding_rounds.each { |round| sum += round.investment}
    sum
  end

  def investors
    funding_rounds.map { |round| round.venture_capitalist }.uniq
  end

  def big_investors
    investors & VentureCapitalist.tres_commas_club
  end

end
