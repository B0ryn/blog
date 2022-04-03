class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_proper_user, only: [:edit, :update, :destroy]

  def show
    @list_of_articles = @user.articles.reorder("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def index
    @list_of_users = User.reorder("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(set_params)
      flash[:notice] = "#{@user.username} was updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(set_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.username} welcome to alpha blog your account was created successfully."
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to root_path
  end

  private
  def set_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_proper_user
    if current_user != @user
      flash[:alert] = "You can only edit your profiles"
    end
  end

end