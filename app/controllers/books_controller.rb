class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :user_info_new_book, only: [:index, :show]

  # def new
  #   @book = Book.new
  # end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id

    if @new_book.save
      redirect_to book_path(@new_book.id)
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    user_info_new_book
    @books = Book.all
  end


  def show
    user_info_new_book
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update

    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    user_id = @book.user.id
    login_user_id = current_user.id
    if (user_id != login_user_id)
      redirect_to books_path
    end
  end
end