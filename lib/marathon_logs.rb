class MarathonLogs
  attr_reader :logs

  def initialize
    @logs = []
  end

  # duration attribute is by hour
  # distance attribute is by km
  def create_log(duration:, distance:)
    logs << { duration: duration, distance: distance }
    "Duration: #{duration} hour/s, Distance: #{distance} km/s."
  end

  def count_logs
    logs.count
  end

  def total_duration
    logs.reduce(0) { |total, log| total + log[:duration] }
  end

  def total_distance
    logs.reduce(0) { |total, log| total + log[:distance] }
  end
end