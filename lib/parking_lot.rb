class ParkingLot

  # class << self
   require_relative "slot"
   attr_accessor :count, :parking_spaces
   def initialize(count)

      @count = 0
      @parking_spaces = []

      count.times do |n|
        @parking_spaces << Slot.new(n)
      end

      @count = @parking_spaces.count
      puts "Created a parking garage with #{@count} slots"

   end

   def park(regno, color)
     #Check available slots and park
     @slot_no=""
     @parking_spaces.each_with_index do |space,index|
       if space.parked_car_regno.empty? && space.parked_car_color.empty?
         space.parked_car_regno = regno
         space.parked_car_color = color
         #comeout of loop if parked
         @slot_no = index.to_s
         puts "Car parked at slot: #{@slot_no+1}"
         break
       end
     end
     #if no slot available
     if @slot_no.empty?
       puts 'No parking space available'
     end

    end

    def leave(slot_no)
      free_slot = @parking_spaces[slot_no-1]
      free_slot.parked_car_regno=""
      free_slot.parked_car_color=""
      puts "Slot number #{slot_no} is free"
    end
  # end

end

loop do
  input = STDIN.gets.strip
  command, *params = input.split /\s/

  case command
    when 'create_parking_lot'
      $parking_lot = ParkingLot.new params[0].to_i
      puts $parking_lot.count
      # puts p.parking_spaces[slotno]
    when 'park'
      $parking_lot.park params[0], params[1]
    when 'leave'
      $parking_lot.leave params[0].to_i
    else
      puts 'Invalid command'
  end
end
