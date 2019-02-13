require 'rails_helper'

RSpec.feature 'task_CRUD', type: :feature do
  let(:task) {create(:task)}

  scenario 'create new task' do
    visit root_path
    expect {
      click_link '新規作成'
      fill_in 'task_title', with: 'new title'
      fill_in 'task_description', with: 'new description'
      click_button 'Create Task'
      expect(page).to have_css '.alert'
    }.to change { Task.count }.by(1)
    
  end

  scenario 'edit task' do
    visit edit_task_path(task)
    fill_in 'task_title', with: 'title_edited'
    fill_in 'task_description', with: 'description_edited'
    click_button 'Update Task'
    expect(page).to have_css '.alert'
    expect(page).to have_content 'title_edited'
  end

  scenario 'delete task' do
    task
    visit root_path
    expect {
      click_link '削除'
      expect(page).to have_css '.alert'
    }.to change { Task.count }.by(-1)
  end


  scenario 'order by created_at DESC' do
  end

end
