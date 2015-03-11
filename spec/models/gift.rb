require_relative '../spec_helper'

describe 'Gift Model' do
  let(:gift) { Gift.new(title: 'Wood Bed Frame', category: 'Furniture') }

  it 'saved a valid gift to the database' do
    gift.save
    saved_gift = Gift.find_by(title: 'Wood Bed Frame')
    expect(save_gift.category).to eq('Furniture')
  end

  it 'flagged gift as purchased' do
    gift.mark_as_purchased
    gift.save
    saved_gift = Gift.find_by(title: 'Wood Bed Frame')
    expect(saved_gift.purchased).to eq(true)
  end

end
