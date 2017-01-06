require 'rails_helper'

feature "user visits root path" do
  VCR.use_cassette("storedom") do
    it "they see stuff" do
        #       As a user
        # When I visit "/"
        # And I fill in a search box with "80202" and click "search"
        # Then my current path should be "/search" (ignoring params)
        # And I should see stores within 25 miles of 80202
        # And I should see a message that says "16 Total Stores"
        # And I should see exactly 15 results
        # And I should see the long name, city, distance, phone number and store type for each of the 15 results
      visit "/"

      fill("#search-field"), with: "80202"
      click "Search"x

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
    end
  end
end
