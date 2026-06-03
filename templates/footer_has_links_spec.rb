require 'rails_helper'

RSpec.describe 'getting links in the footer', type: :feature do

# is the footer placed?
  scenario 'footer exists' do
    visit any_path

# are the styles applied?


# are the link lists available
  scenario 'footer has links' do
    visit root_path
    expect(page).to have_selector("div.footer-list")
  end

#do the links look how they're supposed to?

end