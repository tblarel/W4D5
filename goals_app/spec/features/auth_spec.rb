require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
    visit new_user_path
    expect(page).to have_content("Sign Up")
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      sign_up_as_ginger_baker
      expect(page).to have_content('ginger')
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do

  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do

  end

  scenario 'doesn\'t show username on the homepage after logout' do

  end

end