class Startup

	@@all = []
	attr_accessor :name
	attr_reader :founder, :domain

	def initialize (name, founder, domain)
		@founder = founder
		@name = name
		@domain = domain
		@@all << self
	end

	def self.all
		@@all
	end

	def pivot (domain, name)
		@domain = domain
		@name = name
	end

	def self.domains
		all.map {|s| s.domain}.uniq
	end

	def self.find_by_founder(founder)
		all.select {|s| s.founder == founder}
	end

	def sign_contract (capitalist, type, amount)
		FundingRound.new(self, capitalist, type, amount)
	end

	def num_funding_rounds
		FundingRound.all.select {|f| f.startup == self}
	end

	def total_funds
		num_funding_rounds.sum {|f| f.investment}
	end

	def big_investors
		num_funding_rounds.map { |e| e.venture_capitalist } & VentureCapitalist.tres_commas_club
	end

end
