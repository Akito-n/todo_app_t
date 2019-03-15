class PlofilesController < ApplicationController
  before_action :require_user_logged_in
  def show
  end

  def edit
  end

  def update
    if @current_user.update(plofile_params)
      flash[:success] = t('.succsess')
      redirect_to plofile_path
    else
      render 'edit'
    end
  end

  private

  def plofile_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
