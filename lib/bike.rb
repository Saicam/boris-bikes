class Bike
  @broken = false
  def working?
    !@broken
  end

  def report_broken
    @broken = true
  end

end
