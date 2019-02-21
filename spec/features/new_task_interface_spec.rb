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

  context 'Sort task　by term' do
      let!(:task01) {create(:sort_term_task, :term01)}
      let!(:task02) {create(:sort_term_task, :term02)}
      let!(:task03) {create(:sort_term_task, :term03)}
      let!(:task04) {create(:sort_term_task, :term04)}
      let!(:task05) {create(:sort_term_task, :term05)}
    before do
      visit root_path
    end

    scenario 'Order term ASC' do
      click_link '期日'
      expect(page.html).to match(/.*#{task01.title}.*#{task02.title}.*#{task03.title}.*#{task04.title}.*#{task05.title}/)
    end
    scenario 'Order term DESC' do
      click_link '期日'
      click_link '期日'
      expect(page.html).to match(/.*#{task05.title}.*#{task04.title}.*#{task03.title}.*#{task02.title}.*#{task01.title}/)
    end
  end

  context 'Search task by Ransack' do
      let!(:task01) {create(:sort_term_task, :term01)}
      let!(:task02) {create(:sort_term_task, :term02)}
      let!(:task03) {create(:sort_term_task, :term03)}
      let!(:task04) {create(:sort_term_task, :term04)}
      let!(:task05) {create(:sort_term_task, :term05)}

      before do
        visit root_path
      end

      scenario 'search title' do
        fill_in 'q_title_cont', with: '３'
        click_on '検索'
        expect(page.html).to match(/.*#{task03.title}.*/)
      end

      scenario 'search status'do
        select '完了', from: 'q_status_eq'
        click_on '検索'
        expect(page.html).to match(/.*#{task02.title}.*/)
      end
    end
end
