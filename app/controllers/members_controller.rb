class MembersController < ApplicationController
  before_action :set_group
  before_action :require_user_logged_in
  before_action :require_current_user_be_in_group

  def index
    @members = @group.members.includes(:user)
  end

  def new
  end

  def create
    emails = email_params[:email].split(',')
    error_register = []
    emails.each do |email|
      user = User.find_by(email: email)
      if user.nil?
        error_register << "#{email}は登録されていません"
      elsif @group.members.exists?(user_id: user.id)
        error_register << "#{email}は既にメンバーです！"
      else
        @group.members.create(user_id: user.id)
      end
    end
    error_register << '招待しました！' if error_register.empty?
    flash[:danger] = error_register.join(',')
    redirect_to action: 'index'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      flash[:success] = t('.delete')
      redirect_to group_members_path(group_id: params[:group_id])
    else
      flash.new[:danger] = t('.delete-faild')
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def email_params
    params.require(:info).permit(:email)
  end
end
