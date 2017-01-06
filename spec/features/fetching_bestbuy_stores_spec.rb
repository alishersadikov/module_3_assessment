require 'rails_helper'

feature "user visits root path" do
  it "they search by zipcode" do
      VCR.use_cassette("storedom") do
      visit "/"

      fill_in 'zipcode', with: "80202"
      click_on "Search"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_content("Long Name")
      expect(page).to have_content("City")
      expect(page).to have_content("Phone Number")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Store Type")

      expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("Denver")

      expect(page).to have_content("Best Buy - Parker")
      expect(page).to have_content("303-840-5501")
    end
  end

  it "they see store hours" do
    VCR.use_cassette("store_hours") do
    visit "/"

    fill_in 'zipcode', with: "80202"
    click_on "Search"

    click_on "Best Buy Mobile - Cherry Creek Shopping Center"

#   As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm
  end
end
