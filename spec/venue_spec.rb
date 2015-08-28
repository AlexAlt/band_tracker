require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many (:bands) }

  it('returns false if there is no name') do
    test_venue = Venue.new({:name => "", :city => "Seattle"})
    expect(test_venue.save()).to(eq(false))
  end

  it('capitalizes the venue name')  do
    test_venue = Venue.create({:name => "doug fir lounge", :city => "portland"})
    expect(test_venue.name()).to(eq("Doug Fir Lounge"))
  end

  it('capitalizes the venue city')  do
    test_venue = Venue.create({:name => "doug fir lounge", :city => "portland"})
    expect(test_venue.city()).to(eq("Portland"))
  end
end