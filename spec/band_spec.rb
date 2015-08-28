require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many (:venues) }

  it('returns false if there is no name') do
    test_band = Band.new({:name => "", :hometown => "Portland, OR"})
    expect(test_band.save()).to(eq(false))
  end

   it('capitalizes the band name')  do
    test_band = Band.create({:name => "blind lovejoy", :hometown => "portland"})
    expect(test_band.name()).to(eq("Blind Lovejoy"))
  end

  it('capitalizes the band hometown')  do
    test_band = Band.create({:name => "blind lovejoy", :hometown => "portland"})
    expect(test_band.hometown()).to(eq("Portland"))
  end
end