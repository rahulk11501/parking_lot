class ParkingLot
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
       puts "Car parked at slot: #{@slot_no}"
       break
     end
   end
   #if no slot available
   if @slot_no.empty?
     puts 'No parking space available'
   end

  end

  def exit()

  end

end

def abc(n)
 puts 'abc method'
 p = ParkingLot.new(n)
end
