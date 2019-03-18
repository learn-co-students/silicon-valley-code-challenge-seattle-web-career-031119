class VentureCapitalist

  attr_accessor :name, :total_worth
  attr_reader :domain

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth.to_f
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select {|capitalist|
      capitalist.total_worth > 999999999
    }
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.collect {|round| round.startup}.uniq
  end

  def biggest_investment
    funding_rounds.max_by { |round| round.investment }
  end

  def invested(domain)
    invested_domains = funding_rounds.select {|round| round.startup.domain == domain}
    invested_domains.collect {|round| round.investment}.inject(:+)
  end

end
