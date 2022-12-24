require 'rails_helper'

RSpec.describe 'Sign up Feature page', type: :feature do
    it 'display the sign up page with test sign up' do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    end 

  it "signs users in" do
    visit new_user_registration_path
    fill_in "user_name", :with => "Gordon Otieno"
    fill_in "user_email", :with => "test@test.com"
    fill_in "user_password", :with => "test123"
    fill_in "user_password_confirmation", :with => "test123"
    click_button "Sign up"

    page.should have_content('You need to sign in or sign up before continuing')
  end

end