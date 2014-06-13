require 'spec_helper'
require 'commute'
require 'CSV'

describe Commute do
  #it 'returns true' do
  #  expect(true).to eq(true)
  #end
  #
  #it 'returns the first record from the CSV' do
  #  csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test_csv.csv"
  #  commuter_info = Commute.new(csv_file_path)
  #
  #  expect(commuter_info.return_data).to match_array([["Elsa", "1", "Monday", "Drive", "30", "50", "24"]])
  #end

  it 'sorts the array of arrays and converts into hash' do
    csv_file_path = "/Users/gerard/gSchoolWork/warmups/commute-warm-up/data/test_csv.csv"
    commuter_info = Commute.new(csv_file_path)

    expect(commuter_info.convert_to_hash).to eq({
                                                  "Elsa" => [{:week => 1}, {:week => 5}],
                                                  "Mark" => [{:week => 3}]

    })
  end
end

