require 'rails_helper'

# As a user,
RSpec.describe 'As a user' do
  describe 'when I visit root_path' do
    it 'I can use a search form to find foods and see details about that food' do
      visit root_path

      fill_in 'q', with: 'sweet potatoes'
      click_on 'Search'

      expect(current_path).to eq('/foods')
      expect(page).to have_content('531 items returned')
      expect(page).to have_css('.ndb_number', count: 10)

      expect(page).to have_css('.name')
      expect(page).to have_css('.group')
      expect(page).to have_css('.manufacturer')
    end
  end
end
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
# Then I should see a list of ten foods sorted by relevance.
#
# And for each of the foods I should see:
# - The food's NDB Number
# - The food's name
# - The food group to which the food belongs
# - The food's data source
# - The food's manufacturer
