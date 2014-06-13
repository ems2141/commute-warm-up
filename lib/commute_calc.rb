class CommuteCalc
  def initialize(data)
    @data = data
  end

  def to_hash
    lines = File.readlines(@data)

    results = {}

    csv_data_array = lines.pop(2)

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

    #"Elsa" => [
    #    {
    #        week: 1,
    #        day: "Monday",
    #        mode: "Drive",
    #        inbound: 30,
    #        outbound: 50,
    #        distance: 24
    #    },
    #    {
    #        week: 1,
    #        day: "Tuesday",
    #        mode: "Drive",
    #        inbound: 35,
    #        outbound: 52,
    #        distance: 24
    #    },
    #]
  end
end