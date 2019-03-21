require_relative "bike"

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_reader :capacity
  attr_reader :broken_bikes


  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Max Capacity' if full?
    if bike.working?
      @bikes << bike
    else
      @broken_bikes << bike
    end
  end

  def empty_broken_bikes
    @broken_bikes.clear
  end
  private

  def full?
    (@bikes.count + @broken_bikes.count) >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
