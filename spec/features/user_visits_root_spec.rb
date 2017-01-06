require 'rails_helper'

feature "user visits root path" do
  VCR.use_cassette("storedom") do
    it "they see stuff" do
      visit "/"

      expect(page).to have_content("Storedom")
    end
  end
end
