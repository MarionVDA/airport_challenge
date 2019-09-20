class Plane
  attr_accessor :airport
  attr_accessor :weather

  def initialize
    @airport = []
    @weather = ['sunny', 'sunny', 'sunny', 'stormy']
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
    @airport.count >= 5
  end

  def bad_weather
    @weather.sample == 'stormy'
  end
end
