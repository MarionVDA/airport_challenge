require 'plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Plane do
  subject(:plane) { Plane.new }
  describe 'plane to land'
  it { is_expected.to respond_to :land }

  before do
    allow(plane).to receive(:bad_weather).and_return false
  end
  it 'plane to land at an airport' do
    plane.land(plane)
    expect(plane.airport).to include(plane)
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  describe 'plane to take off'
  it { is_expected.to respond_to :take_off }

  before do
    allow(plane).to receive(:bad_weather).and_return false
  end
  it 'plane to take off from airport' do
    plane.take_off
    expect(plane.airport).not_to include(plane)
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  it 'raise error if airport is full' do
    plane = Plane.new
    plane.airport = ['plane1', 'plane2', 'plane3', 'plane4', 'plane5']
    expect { plane.land(plane) }.to raise_error('Airport full!')
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  before do
    allow(plane).to receive(:bad_weather).and_return true
  end
  it 'raise error if weather is stormy' do
    expect { plane.take_off }.to raise_error('Stormy weather!')
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  before do
    allow(plane).to receive(:bad_weather).and_return true
  end
  it 'raise error if weather is stormy' do
    expect { plane.land(plane) }.to raise_error('Stormy weather!')
  end
end
