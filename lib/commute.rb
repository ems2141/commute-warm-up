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
    target_commuter = commuter_data.fetch(commuter)

    target_commuter.each do |week_data|
      if week_data[:week] == week && week_data[:day] == day_of_week
        return_data = week_data[:inbound]
      end
    end
    return_data
  end

  def average_outbound
    commuter_data = convert_to_hash

    total_commute_time = 0
    total_commutes = 0

    commuter_data.values.each do |commuter|
      commuter.each do |commute_data|
        total_commute_time += commute_data[:outbound]
        total_commutes += 1
      end
    end
    total_commute_time/total_commutes
  end
end