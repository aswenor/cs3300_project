require "rails_helper"

# Test that validates that a title/description is present
RSpec.describe Project, type: :model do
    context "validations tests" do
        it "ensures the title is present" do
            project = Project.new(description: "Content of the description")
            expect(project.valid?).to eq(false)
        end

        # test Project save is successful
        it "should be able to save project" do
            project = Project.new(title: "Title", description: "Some description content goes here")
            expect(project.save).to eq(true)
        end
    end

    # Test that all projects that are created are returned
    context "scopes tests" do
        let(:params) { { title: "Title", description: "some description" } }
        before(:each) do
            Project.create(params)
            Project.create(params)
            Project.create(params)
        end

        it "should return all projects" do
            expect(Project.count).to eq(3)
        end
        
    end
end
