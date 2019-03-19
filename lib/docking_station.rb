require_relative "bike"

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_reader :capacity


  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike broken' unless @bikes.last.working?
    @bikes.pop
  end

  def dock(bike)
    fail 'Max Capacity' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
