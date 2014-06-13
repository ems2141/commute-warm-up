require 'spec_helper'
require_relative '../lib/commute_calc'

describe CommuteCalc do
  it 'returns a hash' do
    csv_data = File.open('/Users/elsaschneiders/gSchoolWork/commute-warm-up/data/commute_csv.csv')
    commute_hash = CommuteCalc.new(csv_data).to_hash

    expected_value = {
        "Elsa" => [
            {
                week: 1,
                day: "Monday",
                mode: "Drive",
                inbound: 30,
                outbound: 50,
                distance: 24
            },
            {
                week: 1,
                day: "Tuesday",
                mode: "Drive",
                inbound: 35,
                outbound: 52,
                distance: 24
            },
        ],
        "Kinsey" => [
            {
                week: 1,
                day: "Tuesday",
                mode: "Drive",
                inbound: 60,
                outbound: 60,
                distance: 25
            }
        ]
    }


    expect(commute_hash).to eq(expected_value)
  end

  it 'returns shows the commute time for Kinsey on Wednesday in week 3' do
    csv_data = File.open('/Users/elsaschneiders/gSchoolWork/commute-warm-up/data/commute_full_sheet.csv')

    expected_value = 60

    expect(CommuteCalc.new(csv_data).commute_time("Kinsey", "Wednesday", 3, "inbound")).to eq(expected_value)
  end

  it 'returns the average time is takes to walk to gSchool' do
    csv_data = File.open('/Users/elsaschneiders/gSchoolWork/commute-warm-up/data/commute_full_sheet.csv')

    expected_value = 16

    expect(CommuteCalc.new(csv_data).average_walk_time("inbound")).to eq(expected_value)
  end
end