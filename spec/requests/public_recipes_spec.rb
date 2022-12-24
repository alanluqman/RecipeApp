require 'rails_helper'

RSpec.describe 'recipe/public_recipe.html.erb', type: :feature do
  describe 'recipe#public_recipe' do
    before(:example) do
      @user = User.create(name: 'Alan', role: 'admin', email: 'test@gmail.com', password: 'password')
      @recipe = Recipe.create(name: 'Pizza', preparation_time: 1, cooking_time: 1, description: 'taste', public: true,
                              author: @user)
      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit user_public_recipes_path(user_id: @user.id)
    end

    it 'should display all the recipe name' do
      expect(page).to have_content(@recipe.name)
    end

    it 'should display recipe description' do
      expect(page).to have_content(@recipe.description)
    end
  end
end
