require 'rails_helper'

RSpec.describe 'Login Feature page', type: :feature do
  before(:example) do
    @subject1 = User.create(name: 'Alan', email: 'alan@gmail.com', password: '123123')

    visit new_user_session_path
  end

  it 'display the login page with test login' do
    expect(page).to have_content('Log in')
  end

  it 'signs users in' do
    fill_in 'user_email', with: 'otienogordon95@gmail.com'
    fill_in 'user_password', with: '123'
    click_button 'Log in'

    page.should have_content('Invalid Email or password')
  end
end
