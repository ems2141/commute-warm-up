require 'spec_helper'
require 'commute'
require 'CSV'

describe Commute do

  it 'sorts the array of arrays and converts into hash' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test.csv"
    commuter_data = Commute.new(csv_file_path)

    expect(commuter_data.convert_to_hash).to eq({
    "Elsa" => [
        {:week => 1, :day => "Wednesday", :mode => "drive", :inbound => 30, :outbound => 50, :distance => 24},
        {:week => 5, :day => "Monday", :mode => "drive", :inbound => 30, :outbound => 50, :distance => 24}
      ],
    "Emily"=>[
        {:week=>2, :day=>"Tuesday", :mode=>"walk", :inbound=>15, :outbound=>20, :distance=>2}],
    "Nate" => [
        {:week => 4, :day => "Wednesday", :mode => "walk", :inbound => 17, :outbound => 20, :distance => 2}
      ]
    })
  end

  it 'returns a the inbound time value for a specific user on a specific day' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test.csv"
    commuter_data = Commute.new(csv_file_path)
    communter_inbound_time = commuter_data.inbound_time("Elsa", 5, "Monday")

    expect(communter_inbound_time).to eq(30)
  end

  it 'returns the average outbound commute time for the class for all the weeks' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test.csv"
    commuter_data = Commute.new(csv_file_path)

    expect(commuter_data.average_outbound).to eq(35)
  end

  it 'returns of the fastest walker in gSchool over the period' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test.csv"
    commuter_data = Commute.new(csv_file_path)

    expect(commuter_data.fastest_walker).to eq("Emily - 8mph")
  end
end
