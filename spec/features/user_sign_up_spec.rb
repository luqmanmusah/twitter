require 'rails_helper'
RSpec.describe 'Create new User proccess', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Sign up' do
    user1 = User.create(username: 'luq', fullname: 'Luq Musah', email: 'luq@gmail.com', password: '123456', password_confirmation: '123456')
    visit new_user_session_path
    click_link_or_button 'Sign up'
    fill_in 'user[username]', with: user1.username
    fill_in 'user[fullname]', with: user1.fullname
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button 'Sign up'
    expect(page).to have_text('Sign In')
  end
end
