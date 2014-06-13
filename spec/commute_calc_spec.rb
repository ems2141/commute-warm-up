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
        ]
    }


    expect(commute_hash).to eq(expected_value)
  end
end