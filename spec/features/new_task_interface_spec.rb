require 'rails_helper'

RSpec.feature 'task_CRUD', type: :feature do
  let(:task) {create(:task)}

  let(:task1) {create(:order_task, :create2013_01_01)}
  let(:task2) {create(:order_task, :create2012_01_01)}
  let(:task3) {create(:order_task, :create2011_01_01)}

  scenario 'create new task' do
    visit root_path
    expect {
      click_link '新規作成'
      fill_in 'task_title', with: 'new title'
      fill_in 'task_description', with: 'new description'
      click_button '登録する'
      expect(page).to have_css '.alert'
    }.to change { Task.count }.by(1)

  end

  scenario 'edit task' do
    visit edit_task_path(task)
    fill_in 'task_title', with: 'title_edited'
    fill_in 'task_description', with: 'description_edited'
    click_button '更新する'
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
    visit root_path
    task2
    task1
    task3
    taskarray = [task1, task2, task3]
    expect(Task.all.order('created_at DESC')).to eq taskarray
  end

end
