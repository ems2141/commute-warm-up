require 'spec_helper'
require 'commute'
require 'CSV'

describe Commute do

  it 'sorts the array of arrays and converts into hash' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test_csv.csv"
    commuter_info = Commute.new(csv_file_path)

    expect(commuter_info.convert_to_hash).to eq({
    "Elsa" => [
        {:week => 1, :day => "Wednesday", :mode => "drive", :inbound => 30, :outbound => 50, :distance => 24},
        {:week => 5, :day => "Monday", :mode => "drive", :inbound => 30, :outbound => 50, :distance => 24}
      ],
    "Mark" => [
        {:week => 3, :day => "Tuesday", :mode => "walk", :inbound => 15, :outbound => 15, :distance => 2}
      ]
    })
  end
end
