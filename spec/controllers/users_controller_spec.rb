require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template(:new)
    end
  end

	describe "GET #show" do 
		it "renders the show template" do 
			User.create!(email: "emma@me.com", password: "good_password")
			get :show, params: { id: 1 }
			expect(response).to render_template(:show)
		end 

		# context "if the user does not exist" do
		# 	it "it is not a success" do
		# 		begin 
		# 			get :show, params: { id: -1 }
		# 		rescue 
		# 			ActiveRecord:RecordNotFound
		# 		end 
		# 		expect(response).not_to render_template(:show)
		# 	end 
		# end
	end 

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
				post :create, params: { user: { email: "roger@me.com", password: "" } }
				expect(response).to render_template(:new);
				expect(flash.now[:errors]).to be_present 
			end

      it "validates that the password is at least 6 characters long" do 
				post :create, params: { user: { email: "roger@me.com", password: "short" } }
				expect(response).to render_template(:new)
				expect(flash.now[:errors]).to be_present
			end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do 
				post :create, params: { user: { email: "roger@me.com", password: "good_password" } }
				expect(response).to redirect_to(user_url(User.find_by(email: "roger@me.com")))
			end
    end
  end
end
