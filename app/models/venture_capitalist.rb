class VentureCapitalist

	@@all = []
	attr_accessor :total_worth
	attr_reader :name

	def initialize (name, total_worth)
		@name = name
		@total_worth = total_worth
		@@all << self
	end

	def self.all
		@@all
	end

	def self.tres_commas_club
		all.select {|v| v.total_worth >= 1000000000}
	end

	def offer_contract(startup, type, amount)
		FundingRound.new(startup, self, type, amount)
	end

	def funding_rounds
		FundingRound.all.select {|f| f.venture_capitalist == self}
	end

	def portfolio
		funding_rounds.map { |e| e.startup  }.uniq
	end

	def biggest_investment
		funding_rounds.max { |a, b| a.investment <=> b.investment }
	end

	def invested (domain)
		funding_rounds.select {|f| f.startup.domain == domain}.sum {|f| f.investment}
	end
end
