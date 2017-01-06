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

      click_on "Best Buy Mobile - Cherry Creek Shopping Center"

      expect(current_path).to eq("/stores/2740")

      expect(page).to have_content("Mon: 10am-9pm")
      expect(page).to have_content("Tue: 10am-9pm")
      expect(page).to have_content("Wed: 10am-9pm")
      expect(page).to have_content("Thurs: 10am-9pm")
      expect(page).to have_content("Fri: 10am-9pm")
      expect(page).to have_content("Sat: 10am-9pm")
      expect(page).to have_content("Sun: 10am-6pm")
    end
  end
end
