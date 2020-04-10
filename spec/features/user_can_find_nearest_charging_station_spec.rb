require 'rails_helper'

describe 'As a User' do
  describe 'from the welcome page' do
    it 'I can search for closest electric fuel station to Turing' do

      visit '/'

      select "Turing", :from => :location

      click_on "Find Nearest Station"

      expect(current_path).to eq('/search')

      # expect(page).to have_css(".results", count: 1)
      expect(page).to have_content("Closest Fuel Station!")

      within (".results") do
        expect(first('.name').text).to_not be_empty
        expect(first('.address').text).to_not be_empty
        expect(first('.fuel-type').text).to_not be_empty
        expect(first('.access-times').text).to_not be_empty
      end
      save_and_open_page

      within('.direction-info') do
        expect('.distance').to eq(".1 miles")
        expect('.travel-time').to eq("1 minute")
        expect(('.directions').text).to_not be_empty
        expect(page).to have_content("Turn left onto Lawrence St Destination will be on the left")
      end
    end
  end
end

# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"
