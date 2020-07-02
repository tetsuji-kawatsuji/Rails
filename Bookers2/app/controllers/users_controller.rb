class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  def top
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
      render action: 'index'
    end
  end

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)

  end

  def show
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @fuser = User.find_by(id: @book.user_id)
  end

  def edit
    @user = current_user
    @book = Book.new(book_params)
  end

  def update
    @book = Book.new(book_params)
    @user = current_user
    if @user.update(user_params)
        redirect_to user_path(@user.id), notice: 'User was successfully updated.'
     else
       render action: 'edit'
     end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.permit(:title, :body)
  end
end
