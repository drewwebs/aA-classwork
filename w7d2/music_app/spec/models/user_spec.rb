require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: "drew@appacademy.io", password: "hunter12")}

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
  end

  describe "class methods" do
    describe "is_password?" do
      it "should check if the user entered the correct password" do
        expect(user.is_password?("hunter12")).to be true
        expect(user.is_password?("hunter13")).to be false
      end
    end

    describe "reset_session_token" do
      it "should reset the users session token" do
        token = user.session_token
        expect(user.session_token).to be(token)
        user.reset_session_token!
        expect(user.session_token).to_not be(token)
      end
    end

    describe "::find_by_credentials" do
      it "should find a user matching the given username and password" do
        user.save
        expect(User.find_by_credentials("drew@appacademy.io", "hunter12")).to eq(user)
        expect(User.find_by_credentials("drew@appacademy.io", "password")).to_not eq(user)
      end
    end

  end
end

