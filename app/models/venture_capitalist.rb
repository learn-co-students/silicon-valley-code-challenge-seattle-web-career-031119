class VentureCapitalist
  attr_accessor :total_worth
  attr_reader :name

  @@all = [ ]

  def self.all
    @@all
  end

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.tres_commas_club
    self.all.select { |vc| vc.total_worth > 1000000000 }
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |round| round.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map { |round| round.startup }.uniq
  end

  def biggest_investment
    funding_rounds.max_by { |round| round.investment}
  end

  # def biggest_investment
  #   largest_amount = 0
  #   largest_round = nil
  #   funding_rounds.each do |round|
  #     if round.investment > largest_amount
  #       largest_round = round
  #       largest_amount = round.investment
  #     end
  #   end
  #   largest_round
  # end

  def invested(domain)
    funding_rounds.inject { |sum, round| sum + round.investment }    
  end

  # def invested(domain)
  #   sum = 0
  #   funding_rounds.each do |round|
  #     if round.startup.domain == domain
  #       sum += round.investment
  #     end
  #   end
  #   sum
  # end

end
