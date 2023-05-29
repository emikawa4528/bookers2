class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :user_info_new_book, only: [:index, :show]

  # def new
  # end

  # def create
  #   @user = User.find(params[:id])
  #   @user.save
  #   redirect_to user_path(current_user.id)
  # end
  
  def index
    user_info_new_book
    @users = User.all
  end

  def show
    user_info_new_book
    @user = User.find(params[:id])
    # @book = Book.new
    @books = @user.books.all
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image )
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if (user_id != login_user_id )
      redirect_to user_path(current_user.id)
    end
  end
end