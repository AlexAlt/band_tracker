require('spec_helper')

describe('the vanue pages path', {:type => :feature}) do
   it('displays a list of all the venues') do
    new_venue = Venue.create({:name => "Doug Fir Lounge", :city => "Portland"})
    visit('/')
    expect(page).to have_content("Doug Fir Lounge")
  end

  it('allows user to add a new venue') do
    visit('/')
    fill_in("venue_name", :with => "Doug Fir Lounge")
    fill_in("venue_city", :with => "Portland")
    click_button("Add Venue")
    expect(page).to have_content("Doug Fir Lounge")
  end
end