require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations tests" do
    it "ensures the username is present" do
      user = User.new(password: "Test password")
      expect(user.valid?).to eq(false)
    end
  
    it "ensures the password is present" do
      user = User.new(username: "Test username")
      expect(user.valid?).to eq(false)
    end

    # test that user is saved successfully
    it "should be able to save user" do
      user = User.new(username: "username", password: "password")
      expect(user.save).to eq(true)
    end
  end

  # Test that all users that are created are returned
  context "scopes tests" do
    let(:params) { { username: "username", password: "some password" } }
    before(:each) do
        User.create(params)
        User.create(params)
        User.create(params)
    end

    it "should return all users" do
        expect(User.count).to eq(3)
    end
  end
end
