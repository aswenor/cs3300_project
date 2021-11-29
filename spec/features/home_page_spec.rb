require "rails_helper"

# test that when visiting the homepage that the user can view the projects
RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end

  # Test that the user can view links
  scenario "The visitor should see edit profile" do
    visit root_path
    if user_signed_in
      expect(page).to have_link("Edit proflie")
    end
  end

  scenario "The visitor should see logout" do
    visit root_path
    if user_signed_in
      expect(page).to have_link("Logout")
    end
  end

  scenario "The visitor should see signup" do
    visit root_path
    if not(user_signed_in)
      expect(page).to have_link("Sign up") 
    end
  end

  scenario "The visitor should see login" do
    visit root_path
    if not(user_signed_in)
      expect(page).to have_link("Login")
    end
  end
end

