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
end