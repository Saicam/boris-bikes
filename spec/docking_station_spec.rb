require 'docking_station.rb'

describe DockingStation do
  let(:bike){double("bike", :working? => true)}

  describe "#release_bike" do
    it { is_expected.to respond_to(:release_bike) }

    it "gets a bike that is working" do
      expect(bike).to be_working
    end

    it "doesn't release broken bikes" do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks a bike" do
      bike = double(:bike)
      allow(bike).to receive(:working?).and_return(true)
      expect(subject.dock(bike)).to include bike
    end

    it "returns docked bike" do
      bike = double(:bike)
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.bikes).to include bike
    end

    it "raises error if there is no bikes" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when docking station is at capacity' do
      allow(bike).to receive(:working?).and_return(true)
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(double(:bike))}.to raise_error 'Max Capacity'
    end
  end

  describe "#initialize" do
    it "can accept docking station capacity" do
      ds = DockingStation.new(30)
      expect(ds.capacity).to eq 30
    end

    it "No capcity given default is set" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe "#empty_broken_bikes" do
    it "empties the broken bikes variable" do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      subject.empty_broken_bikes
      expect(subject.broken_bikes).to eq []
    end
  end
end
