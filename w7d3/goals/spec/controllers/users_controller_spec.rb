require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "POST #create" do
        context "When user is successfully created" do
            let!(:user) {FactoryBot.build(:user)}
            it "should redirect to user_aspirations_url" do
                post :create, params: { user: {email: user.email, password: user.password}}
                expect(response).to redirect_to(user_aspirations_path(User.last))
            end
        end
        context "When user is not successfully created" do
            it "should ensure that it has a valid email" do
                post :create, params: {user: {email: "" , password: "hunter12"}}
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
            it "should ensure that it has a valid password" do
                post :create, params: {user: {email: "richnotrick@thebest.com" , password: "hunt"}}
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
            
        end
    end 
    describe "GET #new" do
        it "renders the new page" do
            get :new 
            expect(response).to render_template("new")
        end
        
        #RIP
        # it "makes a dummy user" do
        #     get :new
        #     expect(@user).to_not be_falsey
        #     expect(@user.email).to be nil
        # end
    end
end

