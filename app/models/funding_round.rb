class FundingRound

	attr_accessor :venture_capitalist, :startup, :type, :investment

	@@all = []

	def initialize (startup, venture_capitalist, type, investment)

		@startup = startup
		@venture_capitalist = venture_capitalist
		@type = type
		if investment.class == Float && investment >= 0
			@investment = investment
		else
			puts "Investment should be float and not negative"
			return 
		end
		@@all << self
	end

	def self.all
		@@all
	end

end
