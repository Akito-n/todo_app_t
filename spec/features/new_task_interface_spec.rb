require 'rails_helper'

RSpec.feature 'task_CRU', type: :feature do
  let(:task) {create(:task)}

  scenario 'create new task' do
    #ページにアクセス
    visit root_path
    expect {
      #新規作成ボタンのクリック
      click_link '新規作成'
      #titleとdesctiptionに文字入れる->保存
      fill_in 'task_title', with: 'new title'
      fill_in 'task_description', with: 'new description'
      click_button 'Create Task'
      expect(page).to have_content '作成しました！'
    }.to change { Task.count }.by(1)

  end

  scenario 'edit task' do
    visit edit_task_path(task)
    fill_in 'task_title', with: 'title_edited'
    fill_in 'task_description', with: 'description_edited'
    click_button 'Update Task'
    expect(page).to have_content '更新しました!'
    expect(page).to have_content 'title_edited'
  end

  scenario 'delete task' do
    task
    visit root_path
    expect {
      click_link '削除'
      expect(page).to have_content '削除しました！'
    }.to change { Task.count }.by(-1)
  end

end
