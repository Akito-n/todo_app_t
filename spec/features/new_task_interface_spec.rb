require 'rails_helper'

RSpec.feature 'task_CRUD', type: :feature do
  let(:task) {create(:task)}
  let(:task2013) {create(:order_task, :created2013_01_01)}
  let(:task2012) {create(:order_task, :create2012_01_01)}
  let(:task2011) {create(:order_task, :create2011_01_01)}

  scenario 'create new task' do
    visit root_path
    expect {
      click_link '新規作成'
      fill_in 'task_title', with: 'new title'
      fill_in 'task_description', with: 'new description'

      click_button '登録'

      expect(page).to have_css '.alert'
    }.to change { Task.count }.by(1)

  end

  scenario 'edit task' do
    visit edit_task_path(task)
    fill_in 'task_title', with: 'title_edited'
    fill_in 'task_description', with: 'description_edited'

    click_button '更新'

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

    task2013
    task2012
    task2011
    visit root_path
    expect(page.html).to match(/.*#{task2013.title}.*#{task2012.title}.*#{task2011.title}/)
  end

  context 'validation' do
    before do
      visit new_task_path
    end
    scenario 'title is empty' do
      fill_in 'task_description', with: 'new description'
      click_button '登録'
      expect(page).to have_content 'titleを入力してください'
    end

    scenario 'title over max length' do
      title = 'a' * 51
      fill_in 'task_title', with: title
      click_button '登録'
      expect(page).to have_content 'titleは50文字以内で入力してください'
    end

    scenario 'description over max length' do
      description = 'a' *  201
      fill_in 'task_title', with: 'title'
      fill_in 'task_description', with: description
      click_button '登録'
      expect(page).to have_content 'descriptionは200文字以内で入力してください'
    end
  end
end
