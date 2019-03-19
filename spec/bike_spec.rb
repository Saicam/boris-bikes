require 'bike'

describe Bike do
  it {is_expected.to respond_to(:working?)}

  it 'reports bike broken' do
    expect(subject.report_broken).to eq true
  end

end
