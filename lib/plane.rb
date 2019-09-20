class Plane
  attr_accessor :airport
  attr_accessor :weather
  attr_accessor :capacity

  def initialize
    @airport = []
    @weather = ['sunny', 'sunny', 'sunny', 'stormy']
    @capacity = 5
  end

  def land(plane)
    raise 'Airport full!' if full?

    raise 'Stormy weather!' if bad_weather

    @airport << plane

  end

  def take_off
    raise 'Stormy weather!' if bad_weather

    @airport.pop
  end

  def full?
    @airport.count >= @capacity
  end

  def bad_weather
    @weather.sample == 'stormy'
  end
end
