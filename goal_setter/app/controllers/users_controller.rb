class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      debugger
      flash[:errors] = ['User could not be found']
      redirect_to new_user_url
    end 
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, status: 422
    end 
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
