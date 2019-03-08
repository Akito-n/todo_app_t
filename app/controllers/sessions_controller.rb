class SessionsController < ApplicationController
  def new; end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = t('.success')
      redirect_to root_path
    else
      flash.now[:danger] = t('.faild')
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to action: 'new'
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      true
    else
      false
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
