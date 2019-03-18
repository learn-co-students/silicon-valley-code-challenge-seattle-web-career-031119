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

end
