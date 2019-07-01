require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


s1 = Startup.new("AAA", "Adam Anderson", "advertisement")
s6 = Startup.new("A2A", "Adam Anderson", "automatics")

s2 = Startup.new("BBB", "Bob Baker", "bonds")
s3 = Startup.new("CCC", "Chris Connor", "cars")
s4 = Startup.new("DDD", "Don Donaldson", "doors")
s5 = Startup.new("EEE", "Ethan Hoke", "entertainment")

v1 = VentureCapitalist.new("Zack Zuckerberg", 1200000000)
v2 = VentureCapitalist.new("Yza Yaits", 300000000)
v3 = VentureCapitalist.new("Xavier Xerjoff", 2000000000)

fr1 = FundingRound.new(s1, v1, "Angel", 1000.0)
fr2 = FundingRound.new(s1, v2, "Pre-Seed", 2000.0)

fr3 = FundingRound.new(s2, v3, "Pre-Seed", 3000.0)
fr4 = FundingRound.new(s4, v2, "Seed", 4000.0)

s1.sign_contract(v2, "Seed", 1500.0)

v1.offer_contract(s1, "Series A", 3500.0)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line