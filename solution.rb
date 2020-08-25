require "pry"

class Listing
    attr_reader :location
    attr_accessor :status, :price, :agent 

    @@all = []

    def initialize(location, price, status="for sale",agent)
        @location = location
        @price = price
        @status = status
        @agent = agent 
        @@all << self
    end

    def price_drop(percentage)
        self.price -= self.price*percentage
    end

    def self.all
        @@all
    end

end

class Agent

    attr_reader :name 
    attr_accessor :telephone, :yrs_experience 

    def initialize(name,telephone,yrs_experience)
        @name = name 
        @telephone = telephone
        @yrs_experience = yrs_experience
    end
    
    def listings
        Listing.all.select{|listing| listing.agent == self}
    end

end

john = Agent.new("John", 1111111111, 2)
house = Listing.new("New York", 2, john)

tim = Agent.new("Tim", 1234567890, 3)
building = Listing.new("New York", 5, tim)

binding.pry 

