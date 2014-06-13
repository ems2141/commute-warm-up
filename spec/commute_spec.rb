require 'spec_helper'
require 'commute'
require 'CSV'

describe Commute do
  it 'sorts the array of arrays and converts into hash' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test_csv.csv"
    commuter_data = Commute.new(csv_file_path)

    expect(commuter_data.convert_to_hash).to eq({
    "Elsa" => [
        {:week => 1, :day => "Wednesday", :mode => "drive", :inbound => 30, :outbound => 50, :distance => 24},
        {:week => 5, :day => "Monday", :mode => "drive", :inbound => 30, :outbound => 50, :distance => 24}
      ],
    "Nate" => [
        {:week => 4, :day => "Wednesday", :mode => "walk", :inbound => 15, :outbound => 20, :distance => 2}
      ]
    })
  end

  it 'returns a the inbound time value for a specific user on a specific day' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test_csv.csv"
    commuter_data = Commute.new(csv_file_path)
    communter_inbound_time = commuter_data.inbound_time("Elsa", 5, "Monday")

    expect(communter_inbound_time).to eq(30)
  end

  it 'returns the average outbound commute time for the class for all the weeks' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test_csv.csv"
    commuter_data = Commute.new(csv_file_path)

    expect(commuter_data.average_outbound).to eq(40)
  end
end
#For all 5 weeks, what was the group average commute time?