class Room

    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if @capacity > @occupants.length
            return false
        else
            return true
        end
    end

    def available_space
        return @capacity - @occupants.length
    end

    def add_occupant(name)
        if self.full?
            return false
        else
            @occupants << name
            return true
        end
    end  
end