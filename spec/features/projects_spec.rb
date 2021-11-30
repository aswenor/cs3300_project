require 'rails_helper'

# Behavior test that creates a new project and fills in the title 
RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)  
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    # fill in the description and create the project and expect to see successful creation text
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    # description is blank and test that the project creation fails 
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  # Update the project to add title and description
  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user) 
      visit edit_project_path(project)
    end

    # Update the description and update the project and it should show text that update was successful
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    # Enter blank description and update project should fail due to blank description
    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  # Delete the project by removing the path to the project and destory should be successful
  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      user = FactoryBot.create(:user)
      login_as(user) 
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end




