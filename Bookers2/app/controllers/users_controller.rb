class UsersController < ApplicationController
  def top
  end

  def create
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
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
        redirect_to user_path(@user.id), notice: 'User was successfully updated.'
     else
       render action: 'edit'
     end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  def book_params
    params.permit(:title, :opinion)
  end
end
