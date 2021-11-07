require "rails_helper"

# Test for getting a project at a certain index is successful
RSpec.describe ProjectsController, type: :controller do
    context "GET #index" do
        it "returns a success response" do
            get :index
            # expect(response.success).to eq(true)
            expect(response).to be_success
        end
    end

    # Test that showing the project with a certain id shows successfully 
    context "GET #show" do
        let!(:project) { Project.create(title: "Test title", description: "Test description") }
        it "returns a success response" do
            get :show, params: { id: project }
            expect(response).to be_success
        end
    end
end
