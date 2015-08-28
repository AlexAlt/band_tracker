require('spec_helper')

describe('the band pages path', {:type => :feature}) do
  it('displays a list of all the bands') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    visit('/')
    expect(page).to have_content("Blind Lovejoy")
  end

  it('allows user to add a new band', {:type => :feature}) do
    visit('/')
    fill_in("band_name", :with => "Blind Lovejoy")
    fill_in("band_city", :with => "Portland")
    fill_in("state", :with => "OR")
    click_button("Add Band")
    expect(page).to have_content("Blind Lovejoy")
  end

  it('brings user to a details page for a specific band') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    visit('/')
    click_link('Blind Lovejoy')
    expect(page).to have_content("Blind Lovejoy")
  end

  it('brings user to a band edit form') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    visit("/bands/#{new_band.id}")
    click_link("Edit Band")
    expect(page).to have_content("Edit")
  end

  it('allows user to edit name') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    visit("/bands/#{new_band.id}/edit")
    fill_in("name", :with => "Deaf Lovejoy")
    click_button("Edit Name")
    expect(page).to have_content("Deaf Lovejoy")
  end

   it('allows user to edit city') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    visit("/bands/#{new_band.id}/edit")
    fill_in("city", :with => "Bend")
    click_button("Change City")
    expect(page).to have_content("Bend,")
  end

   it('allows user to edit state') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    visit("/bands/#{new_band.id}/edit")
    fill_in("state", :with => "ME")
    click_button("Change State")
    expect(page).to have_content("ME")
  end

  it('allows user to add a venue to a band') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    new_venue = Venue.create({:name => "Doug Fir Lounge", :city => "Portland"})
    visit("/bands/#{new_band.id}/edit")
    select("Doug Fir Lounge")
    click_button("Add Venue")
    expect(page).to have_content("Doug Fir Lounge")
  end
end



