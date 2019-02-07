require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  render_views
  it "get new" do
    get :new
    expect(response.status).to eq(200)
  end

  it "get index" do
    get :index
    expect(response.status).to eq(200)
  end
end
