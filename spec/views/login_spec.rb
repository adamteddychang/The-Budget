require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'login' do
    before(:each) do
      @user = User.create!(email: 'user@email.com', name: 'User Name', password: '123456', id: 1)
      visit '/users/sign_in'
    end

    it 'can enter a name and receive a greeting' do
      visit user_session_path
      expect(page).to have_content 'LOGIN'
    end

    it 'user can see inputs and button' do
      visit user_session_path
      expect(page).to have_current_path(user_session_path)
    end

    it 'click the login error' do
      visit user_session_path
      click_button
      expect(page).to have_content 'Invalid Email or password.'
    end

    it ' I cannot log in with incorrect user details' do
      fill_in 'Email', with: 'usr@email.cm'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end
  end
end
