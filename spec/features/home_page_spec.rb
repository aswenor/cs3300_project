require "rails_helper"

# test that when visiting the homepafe that the user can view the projects
RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end

