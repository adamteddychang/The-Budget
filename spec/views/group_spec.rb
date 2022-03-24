require 'rails_helper'

RSpec.feature 'Group Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Example', email: 'hello@hello.com', password: 'password')
    @group = Group.create(name: 'Shopping', icon: 'https://image.com', user_id: @user.id)
    visit user_session_path
    fill_in placeholder: 'Email', with: 'hello@hello.com'
    fill_in placeholder: 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'Login successfully' do
    expect(page).to have_current_path(root_path)
  end

  it 'Show Categories' do
    expect(page).to have_content 'Categories'
  end

  # it 'show category name' do
  #   expect(page).to have_content @group.name
  # end

  # it 'show category icon' do
  #   expect(page).to have_selector('img')
  # end
  # it 'Navigate to the create category' do
  #   click_link('Add Category')
  #   expect(page).to have_current_path(new_group_path)
  # end
end
