class CommuteCalc
  def initialize(data)
    @data = data
  end

  def to_hash
    lines = File.readlines(@data)

    results = {}

    csv_data_array = lines.pop(lines.length-1)

    csv_data_array.each do |line|
      line.gsub!("\r\n", "")
      array = line.split(",")
      if results[array[0]] == nil
        results[array[0]] = [{
                                 :week => array[1].to_i,
                                 :day => array[2],
                                 :mode => array[3],
                                 :inbound => array[4].to_i,
                                 :outbound => array[5].to_i,
                                 :distance => array[6].to_i
                             }]
      else
        results[array[0]] << {
            :week => array[1].to_i,
            :day => array[2],
            :mode => array[3],
            :inbound => array[4].to_i,
            :outbound => array[5].to_i,
            :distance => array[6].to_i
        }

      end
    end
    results
  end

  def commute_time(person, day, week, direction)
    hashed_data = self.to_hash
    output = 0
    hashed_data[person].each do |commute|
      if commute[:week] == week && commute[:day] == day
        output = commute[direction.to_sym]
      end
    end
    output
  end

  def average_walk_time(direction)
    hashed_data = self.to_hash

    people = hashed_data.keys
    array_of_times = []
    people.each do |person|
      travel_array_for_person = hashed_data[person]
      travel_array_for_person.each do |stat|
        if stat[:mode] == "Walk"
          array_of_times << stat[direction.to_sym]
        end
      end
    end
    sum = array_of_times.inject { |sum, n| sum + n }
    sum/(array_of_times.length)
  end
end