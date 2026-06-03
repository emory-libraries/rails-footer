# frozen_string_literal: true
require 'rails_helper'

# RSpec.describe 'getting links in the footer', type: :feature do
RSpec.describe "given a random page, there's a footer", type: :feature do
  # context 'get a random page path' do 
  describe 'page' do 
    let(:possible_paths) { Rails.application.routes.named_routes.helper_names.reject { |item| item.include?("rails") || item.include?("turbo") || item.include?("url")} }
  let(:mystery_path) { possible_paths.sample }

  before do
#     puts possible_paths
#     puts any_path
  visit mystery_path
end
# end
# scenario "user visits a random page" do
# it "can pick a random path" do

# end

it 'footer has links' do
  # visit root_path
  # visit mystery_path
  expect(page).to have_selector("div.footer-list")
  puts current_path
  # puts any_path
end
# is the footer placed?
it 'has a footer' do
  # visit mystery_path
  expect(page).to have_selector("footer")
  # puts page
end

# are the styles applied?
# scenario "footer has grids?" do


# are the link lists available

# do the links show up how they're supposed to?
end
end