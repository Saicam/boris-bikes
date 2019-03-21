require 'vans'

describe Vans do
  describe "#collect_broken_bikes" do
    it { is_expected.to respond_to(:collect_broken_bikes) }

    it "collects broken bikes from docking station" do
      ds = DockingStation.new
      bike = Bike.new
      bike.report_broken
      ds.dock(bike)
      subject.collect_broken_bikes(ds)
      is_each_bike_working = subject.broken_bikes.map { |bike| bike.working? }
      expect(is_each_bike_working).not_to include true
    end
  end

  describe "#distributes_working_bikes" do

  it { is_expected.to respond_to(:distributes_working_bikes) }

  it "distributes_working_bikes that are working" do
    subject.distributes_working_bikes
    expect(subject.bike.working?).to eq true
  end

  describe "#collect_working_bikes" do
    it "collects working bikes from a garage" do
      expect("Test not done").to eq false
    end
  end

 end
end
