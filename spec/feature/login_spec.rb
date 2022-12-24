require 'rails_helper'

RSpec.describe 'Login Feature page', type: :feature do
    it 'display the login page with test login' do
    visit new_user_session_path
    expect(page).to have_content('Log in')
    end 

  it "signs users in" do
    visit new_user_session_path
    fill_in "user_email", :with => "otienogordon95@gmail.com"
    fill_in "user_password", :with => "123"
    click_button "Log in"

    page.should have_content('Invalid Email or password')
  end

end