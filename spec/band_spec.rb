require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many (:venues) }

  it('returns false if there is no name') do
    test_band = Band.new({:name => "", :city => "Portland", :state => "OR"})
    expect(test_band.save()).to(eq(false))
  end

  it('returns false if there is no city') do
    test_band = Band.new({:name => "Blind Lovejoy", :city => "", :state => "OR"})
    expect(test_band.save()).to(eq(false))
  end

  it('returns false if there is no state') do
    test_band = Band.new({:name => "Blind Lovejoy", :city => "Portland", :state => ""})
    expect(test_band.save()).to(eq(false))
  end

  it('capitalizes the band name if multi word')  do
    test_band = Band.create({:name => "blind lovejoy", :city => "Portland", :state => "OR"})
    expect(test_band.name()).to(eq("Blind Lovejoy"))
  end

  it('capitalizes the band name if one word')  do
    test_band = Band.create({:name => "creed", :city => "Portland", :state => "OR"})
    expect(test_band.name()).to(eq("Creed"))
  end

  it('capitalizes the band name properly if already capitalized')  do
    test_band = Band.create({:name => "Creed", :city => "Portland", :state => "OR"})
    expect(test_band.name()).to(eq("Creed"))
  end

  it('capitalizes the band name if capitalization in different places')  do
    test_band = Band.create({:name => "no Use for A Name", :city => "Portland", :state => "OR"})
    expect(test_band.name()).to(eq("No Use For A Name"))
  end

  it('capitalizes the band city')  do
    test_band = Band.create({:name => "blind lovejoy", :city => "portland", :state => "OR"})
    expect(test_band.city()).to(eq("Portland"))
  end

  it('capitalizes the band city if already capitalized')  do
    test_band = Band.create({:name => "blind lovejoy", :city => "Portland", :state => "OR"})
    expect(test_band.city()).to(eq("Portland"))
  end

  it('capitalizes the band state')  do
    test_band = Band.create({:name => "blind lovejoy", :city => "portland", :state => "or"})
    expect(test_band.state()).to(eq("OR"))
  end
end