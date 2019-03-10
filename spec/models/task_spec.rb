require 'rails_helper'

describe Task do
  describe 'Search' do
    let!(:user) {create(:user)}
    let!(:group) {create(:group)}
    let!(:task01) {create(:sort_term_task, :term01, user: user, group: group)}
    let!(:task02) {create(:sort_term_task, :term02, user: user, group: group)}
    let!(:task03) {create(:sort_term_task, :term03, user: user, group: group)}
    let!(:task04) {create(:sort_term_task, :term04, user: user, group: group)}
    let!(:task05) {create(:sort_term_task, :term05, user: user, group: group)}

    it 'is 1　result Search for title_cont by "３" ' do
      @params = { q:{ title_cont: '３' } }
      expect(Task.ransack(@params[:q]).result.count).to eq(1)
    end

    it 'is 1　result Search for status_eq by 2 ' do
      @params = {q: {status_eq: 2 } }
      expect(Task.ransack(@params[:q]).result.count).to eq(1)
    end
  end
end
