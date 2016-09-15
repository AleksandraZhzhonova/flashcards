require 'spec_helper'
require "rails_helper"

describe 'Card' do
  it 'adds 3 days to current review date' do
    card = FactoryGirl.create(:card)
    expect(card.review_date.strftime("%a, %d %b %Y")).to eq(4.days.since.strftime("%a, %d %b %Y"))
  end
end
