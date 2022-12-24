require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  describe 'users#index' do
    before(:example) do
      @user = User.create(name: 'Alan', role: 'admin', email: 'test@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'should display user name' do
      expect(page).to have_content(@user.name)
    end

    it 'should display RecipeApp' do
      expect(page).to have_content('RecipeApp')
    end
  end
end
