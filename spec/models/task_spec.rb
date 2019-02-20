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

end
