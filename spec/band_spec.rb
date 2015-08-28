require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many (:venues) }

  it('returns false if there is no name') do
    test_band = Band.new({:name => "", :city => "Portland", :state => "OR"})
    expect(test_band.save()).to(eq(false))
  end

   it('capitalizes the band name')  do
    test_band = Band.create({:name => "blind lovejoy", :city => "Portland", :state => "OR"})
    expect(test_band.name()).to(eq("Blind Lovejoy"))
  end

  it('capitalizes the band city')  do
    test_band = Band.create({:name => "blind lovejoy", :city => "portland", :state => "OR"})
    expect(test_band.city()).to(eq("Portland"))
  end

  it('capitalizes the band state')  do
    test_band = Band.create({:name => "blind lovejoy", :city => "portland", :state => "or"})
    expect(test_band.state()).to(eq("OR"))
  end
end