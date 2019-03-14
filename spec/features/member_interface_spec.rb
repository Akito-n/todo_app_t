require 'rails_helper'

RSpec.feature 'Member_CRUD', type: :feature do
  let!(:user) { create(:user) }
  let!(:new_user) {create(:new_user)}
  let!(:group) { create(:group) }
  let!(:member) { create(:member, user: user, group: group, role: 2 ) }

  let(:member2) {create(:member, user: new_user, group: group)}

  before do
    visit login_path
    fill_in 'Email', with: 'sample@samp.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'invite new_user to "テストグループ"' do
    visit root_path
    click_on 'テストグループ'
    click_on 'Member'
    click_link 'メンバーを招待する'
    fill_in 'info_email', with: new_user.email
    click_on '招待'
    expect(page).to have_content new_user.name
  end

  scenario 'delete new_user to テストグループ' do
     member2
     visit root_path
     click_on 'テストグループ'
     click_on 'Member'
     expect(page).to have_content new_user.name
     click_on(class: 'delete-button')
     expect(page).not_to have_content new_user.name
  end

end
