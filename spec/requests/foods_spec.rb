require 'rails_helper'

RSpec.describe 'food/index.html.erb', type: :feature do
  describe 'Food#index' do
    before(:each) do
      @user = User.create!(name: 'Alan', role: 'admin', email: 'test@gmail.com', password: 'password')
      Food.create!(name: 'orange', measurement_unit: 'grams', price: 10, author: @user)

      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit user_food_index_path(user_id: @user.id)
    end

    it 'should display all the food details' do
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
