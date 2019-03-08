require 'rails_helper'

RSpec.feature 'sessions', type: :feature do
  let!(:user) { create(:user) }

  context 'login/logout' do
    scenario 'login' do
      visit login_path
      fill_in 'Email', with: 'sample@samp.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'タスク一覧'
    end

    scenario 'logout and require login' do
      visit login_path
      fill_in 'Email', with: 'sample@samp.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Log Out'
      visit tasks_path
      expect(page).not_to have_content 'タスク一覧'
    end

    scenario 'login with faild email or password' do
      visit login_path
      fill_in 'Email', with: 'failed_sample@samp.com'
      fill_in 'Password', with: 'faild_password'
      click_button 'Log in'
      expect(page).not_to have_content 'タスク一覧'
    end
  end
end
