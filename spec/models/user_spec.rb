require 'rails_helper'

RSpec.describe User, type: :model do	
	subject(:user) do 
		User.new(email: "ade@me.com", password: "good_password")
	end 

	describe "validations" do 
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password_digest).with_message("Password can't be blank") }
		it { should validate_length_of(:password).is_at_least(6).on(:create) }
	end 

	describe "instance methods" do 
		describe "#is_password?" do 
			it "verifies a password is correct" do 
				expect(user.is_password?("good_password")).to be true
			end 

			it "verifies a password is not correct" do 
				expect(user.is_password?("bad_password")).to be false
			end 
		end 
	end 

	describe "class methods" do 
		describe "::find_by_credentials" do 
			before { user.save! }

			it "returns correct user if provided valid credentials" do
				expect(User.find_by_credentials("ade@me.com", "good_password")).to eq(user)
			end 

			it "returns nil if provided incorrect credentials" do
				expect(User.find_by_credentials("ade@me.com", "bad_password")).to eq(nil)
			end
		end 
	end 
end
