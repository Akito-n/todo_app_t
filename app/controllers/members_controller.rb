class MembersController < ApplicationController
  before_action :set_group
  
  def index
    @members = @group.members
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
