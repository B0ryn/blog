class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)

    if @user.save
      flash[:notice] = "#{@user.username} was created successfully."
      redirect_to articles_path
    else
      render 'new'
    end
  end


  private
  def set_params
    params.require(:user).permit(:username, :email, :password)
  end

end