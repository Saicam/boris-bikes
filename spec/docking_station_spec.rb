require 'docking_station.rb'

describe DockingStation do
  let(:bike){double :bike}

  it { is_expected.to respond_to(:release_bike) }

  it "gets a bike that is working" do
    allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq true
  end

  it "docks a bike" do
    bike = double(:bike)
    expect(subject.dock(bike)).to include bike
  end

  it "returns docked bike" do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.bikes).to include bike
  end

  it "raises error if there is no bikes" do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it 'raises an error when docking station is at capacity' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock double(:bike)}
    expect { subject.dock(double(:bike))}.to raise_error 'Max Capacity'
  end

  it "can accept docking station capacity" do
    ds = DockingStation.new(30)
    expect(ds.capacity).to eq 30
  end

  it "No capcity given default is set" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "doesn't release broken bikes" do
    allow(bike).to receive(:working?).and_return(false)
    subject.dock(bike)
    expect{subject.release_bike}.to raise_error 'Bike broken'
  end

end
