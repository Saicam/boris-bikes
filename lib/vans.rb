require_relative "bike"
require_relative "docking_station"

class Vans
  attr_reader :broken_bikes
  attr_reader :bike
  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bikes(dock_station)
    dock_station.broken_bikes.each { |bike| @broken_bikes << bike }
    dock_station.empty_broken_bikes
    @broken_bikes
  end

  def collect_working_bikes(garage)
    garage.working_bikes.each { |bike| @working_bikes << bike }
    garage.empty_working_bikes
    @working_bikes
  end

  def distributes_working_bikes
    @bike = Bike.new
  end

end
