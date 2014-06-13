class Commute
  def initialize(data)
    @data = CSV.read(data).sort
  end

  def store_keys
    return_keys = {}
    @data.each do |row|
      return_keys.store(row[0], [])
    end
    return_keys
  end

  def convert_to_hash
    return_data = store_keys

    return_data.each_pair do |commuter, commuter_data_array|
      commuter_data = commuter_data_array
      @data.each do |row|
        if row[0] == commuter
          week_commute_data =
            {:week => row[1].to_i, :day => row[2], :mode => row[3], :inbound => row[4].to_i, :outbound => row[5].to_i, :distance => row[6].to_i}
          commuter_data << week_commute_data
          return_data[commuter] = commuter_data
        end
      end
    end
    return_data
  end

  def inbound_time(commuter, week, day_of_week)
    return_data = nil
    commuter_data = convert_to_hash
    x = commuter_data.fetch(commuter)

    x.each do |y|
      if y[:week] == week && y[:day] == day_of_week
        return_data = y[:inbound]
      end
    end
    return_data
  end
end