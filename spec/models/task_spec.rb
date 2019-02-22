require 'rails_helper'

describe Task do
  describe 'validation' do
    it 'is valid with title' do
      task = Task.new(
        title: 'title'
      )
      expect(task).to be_valid
    end

    it 'is not valied title be empty ' do
      task = Task.new(
        title: nil
      )
      expect(task).to_not be_valid
    end

    it 'is not valied title with more than 50 characters' do
      task = Task.new(
        title: 'a' * 51
      )
      expect(task).to_not be_valid
    end

    it 'is not valied description with more than 200 characters' do
      task = Task.new(
        title: 'title',
        description: 'a' * 201
      )
      expect(task).to_not be_valid
    end
  end

  describe 'Search' do
    let!(:task01) {create(:sort_term_task, :term01)}
    let!(:task02) {create(:sort_term_task, :term02)}
    let!(:task03) {create(:sort_term_task, :term03)}
    let!(:task04) {create(:sort_term_task, :term04)}
    let!(:task05) {create(:sort_term_task, :term05)}

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
