require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

    scenario 'has a new user page' do
        visit new_user_url
        expect(page).to have_content "New user"
    end

    # scenario 'signing up a user' do
    #     before(:each) do
    #         visit new_user_url
    #         fill_in "Email", :with => "nickanddrew@appacademyinstructors.io" 
    #         fill_in "Password", :with => "hunter12"
    #         click_on "Create user"
    #     end
    # end
#NOOOOOOOOOOO IT DIDNT WORK

    scenario 'shows username on the homepage after signup' do
        visit new_user_url
        expect(page).to have_content "#{User.last.email}"

    end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' 
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end