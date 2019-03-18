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

end
