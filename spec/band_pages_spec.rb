require('spec_helper')

describe('the band pages path', {:type => :feature}) do
  it('displays a list of all the bands') do
    new_band = Band.create({:name => "Blind Lovejoy", :city => "Portland", :state => "OR"})
    visit('/')
    expect(page).to have_content("Blind Lovejoy")
  end

  it('allows user to add a new band', {:type => :feature}) do
    visit('/')
    fill_in("name", :with => "Blind Lovejoy")
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

  # it('allows user to edit name') do
  #   new_band = Band.create({:name => "Blind Lovejoy", :hometown => "Portland"})
  #   visit("/bands/#{new_band.id}/edit")
  #   fill_in("name", :with => "Deaf Lovejoy")
  #   click_button("Edit Name")
  #   expect(page).to have_content("Deaf Lovejoy")
  # end

  #  it('allows user to edit hometown') do
  #   new_band = Band.create({:name => "Blind Lovejoy", :hometown => "Portland"})
  #   visit("/bands/#{new_band.id}/edit")
  #   fill_in("hometown", :with => "Portland, OR")
  #   click_button("Change Hometown")
  #   expect(page).to have_content("Portland, OR")
  # end
end