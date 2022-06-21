require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        new_sent = []
        sent = @name.split(" ")
        sent.each_with_index do |word, i|
            new_sent << word[0].upcase + word[1..-1].downcase
        end
        new_name = new_sent.join(" ")
        new_name
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name}" + " " + "#{room.available_space}"
        end
    end
end
